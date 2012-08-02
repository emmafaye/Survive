/**
 * tfpPawn.uc
 * This is a version of UTPawn that supports a 'true first person' viewpoint.
 * For more information on a true first person viewpoint, visit the following site:
 * http://krisredbeard.wordpress.com/articles/true-first-person-viewpoint/
 *
 * Author: Kris Rigby
 * E-mail: kris@dude.com.au
 * Website: krisredbeard.wordpress.com
 */
class tfpPawn extends UTPawn;

//================================================================================================================================================
// BEGIN VARIABLES
//================================================================================================================================================

// ** TRUE FIRST PERSON **
// Name of the socket our camera should be attached too.
// The mesh should have this socket attached somewhere or the players viewpoint
// will use the old method (Location + BaseEyeHeight * vect(0,0,1)).
var(TFP) name EyeSocket;
var SkeletalMeshComponent HeadMesh; 

// ** TORSO ROTATIONS **
//	Used for separate torso rotation compared to legs, head or pawn rotation.
//		ie. Freeaim, recoil, head/face tracking...
//	+/- range from the view rotation (+ = right, - = left) 
//	See UpdateOffsetNodes() for usage
var rotator TorsoOffset;
var array<AnimNodeSequenceBlendByAim> TorsoAimNodes;

// ** LEGS & TURNING **
//	Used for separate torso rotation compared to legs, head or pawn rotation.
//	+/- range from the pawn rotation (+ = right, - = left) 
//	NOTE: animation tree requires a tfpAnimBlendByIdle animation node to set the correct root bone rotation
//	See UpdateLegsYaw() for usage
var rotator LegsOffset;

// Used by tfpAnimBlendByTurnInPlace to play select the correct child animation when turning in place.
var int LegsTurning;

// Used to remember our raw rotation's yaw from last tick.
var int OldYaw;

// List of all AnimNodeBlendDirectional nodes for toros twisting.
var array<AnimNodeBlendDirectional> DirectionalNodes;

// Affects how legs match movement/torso rotation.
var(LegsOffset) int MaxLegsYawIdle;
var(LegsOffset) int MaxYawLegsRun;
var(LegsOffset) int MaxLegsYawChangePerSecond;

// ** WEAPON AIMING **
//	aka. Iron sight support, ADS, Aiming Down Sight.
// For adjusting the players weapon position when aiming.
var SkelControlSingleBone GunAimAdjustNode;

// For adjusting the palyers head rotation while aiming.
// Could be used to show a separate look direction too.
var SkelControlSingleBone HeadAimAdjustNode;

// True if aiming, replicated from server to client.
var repnotify bool bWeaponAiming;

// Allows us to keep track of when the player starts or stops aiming.
var bool bOldWeaponAiming;

// For smoothly chaning our aim & fov.
var float fChangeAimTime;

// Affects how legs match movement/torso rotation.
var(WeaponAiming) float TimeToChangeAim;
//var(WeaponAiming) float DesiredAimFOV;

// ** WEAPON OBSTRUCTION **
var name IK_WeaponSocket;
var float fLastWCTime;

// 0 = not, 1 = low, 2 = low, crouched, 3 = high
var byte bWeaponObstructed;
var byte oldWeaponObstructed;

// last actor that our weapon collided with (used by AI)
var Actor LastWCWith;

// last actor that obstructed us (used by AI)
var float fDelayStartFire;

// For adjusting the players weapon position when it is obstructed.
var SkelControlSingleBone WO_LeftHand;
var SkelControlSingleBone WO_RightHand_Low;
var SkelControlSingleBone WO_RightHand_LowCrouched;
var SkelControlSingleBone WO_RightHand_High;

// ** SPRINTING **
// Only set if we ARE actually sprinting
var bool bIsSprinting;

// Set when we WANT to sprint
var bool bWantsToSprint;

// Set when we have to release and press sprint again
var bool bNeedToReleaseSprint;

// For adjusting the players weapon position when sprinting.
var SkelControlSingleBone GunSprintAdjust;

// Sound of air rushing past the players ears while sprinting/falling
var(Sounds) editconst const AudioComponent AirMovingPastEarsSound;

// ** OTHER VARIABLES **
// Slot nodes used for playing torso and arm animations that have been customised to support mirroring.
var array<tfpAnimNodeSlotMirror> RightArmAnimSlots, LeftArmAnimSlots, TorsoAnimSlots;

// For keeping track of what slot nodes are playing instead of checking the whole array.
var bool RightArmSlotsPlaying, LeftArmSlotsPlaying, TorsoSlotsPlaying;

// Remember if the player wants to fire, just in case they are forced not too.
// If true, the player will call StartFire(0) as soon as they are able.
// Set by StartFire(0) && StopFire(0).
var bool bWantsToFire;

var bool bFixedTracking;

// Holds the class type of the current pickup mesh.
// Replicated to all clients.
var	repnotify	class<Actor> CurrentPickupClass;
var tfpPickupAttachment CurrentPickupAttachment;
var() float TimeToPickup;

var	repnotify class<UTWeaponAttachment>	LeftShoulderWeaponAttachmentClass, RightShoulderWeaponAttachmentClass;
var UTWeaponAttachment LeftShoulderWeaponAttachment, RightShoulderWeaponAttachment;

var name LeftShoulderSocket, RightShoulderSocket;

var bool bLongFall;
var() float LongFallTime;

var(Swimming) float WaterLevelOffsetZ;
var bool bAtWaterLevel;
var bool bJumpAtWaterLevel;
var() float WaterJumpTime;
var vector WaterJumpDir;

var AnimNodeSequenceBlendByAim JumpLeanNode;
var vector JumpLeanDir;

var bool bOldIsCrouched;

var bool bMantling;
var float MantleZ;
var vector MantleJumpDir;

var array<AnimNodeSequence> TorsoNodes;
struct ReplicatedTorsoNodeInfo
{
	var float CurrentTime;
	var int Index;
};

var repnotify ReplicatedTorsoNodeInfo RTNI;

var float fSmoothFloorChange;
var float fFloorChangeTime;
var float FloorChangeDelayTime;


//================================================================================================================================================
// END VARIABLES
//================================================================================================================================================

//================================================================================================================================================
// START DISABLED FUNCTIONS
//================================================================================================================================================

simulated function SetCharacterClassFromInfo(class<UTFamilyInfo> Info);
simulated function SetMeshVisibility(bool bVisible);
event UpdateEyeHeight( float DeltaTime );
simulated function SetWeapAnimType(EWeapAnimType AnimType);

//================================================================================================================================================
// END DISABLED FUNCTIONS
//================================================================================================================================================

//================================================================================================================================================
// START REPLICATION
//================================================================================================================================================

replication
{
	// Variables the server should send ALL clients.
	if (bNetDirty)
		CurrentPickupClass, LeftShoulderWeaponAttachmentClass, RightShoulderWeaponAttachmentClass, RTNI;

	// Sent to non owning clients
	if ( bNetDirty && (!bNetOwner || bDemoRecording) )
		bIsSprinting, bWeaponAiming, bWeaponObstructed, fDelayStartFire;
}

/*
ReplicatedEvent
	Check on various replicated data and act accordingly.
*/
simulated event ReplicatedEvent(name VarName)
{
	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "VarName:" @ VarName );
	
	if (VarName == 'CurrentPickupClass')
		CurrentPickupChanged();
	else if ((VarName == 'LeftShoulderWeaponAttachmentClass') || (VarName == 'RightShoulderWeaponAttachmentClass'))
		ShoulderedWeaponChanged();
	else if (VarName == 'bWeaponAiming')
		SetAimState(bWeaponAiming);
	else if (VarName == 'RTNI')
		SyncTorsoAnimNodes();
	else
		Super.ReplicatedEvent(VarName);
}

//================================================================================================================================================
// END REPLICATION
//================================================================================================================================================

//================================================================================================================================================
// START HELPER FUNCTIONS
//================================================================================================================================================

/*
AddOnScreenError
*/
simulated function AddOnScreenError(string ErrorText, optional float Life = 10.0f)
{
	if (IsHumanControlled() && IsLocallyControlled() && (tfpPlayerController(Controller) != None))
		tfpPlayerController(Controller).AddOnScreenError(ErrorText, Life);
}

/*
DrawEyeAxis
*/
simulated function DrawEyeAxis()
{
	local vector axisLoc;
	local rotator axisRot;
	GetActorEyesViewPoint(axisLoc, axisRot);
	DrawDebugCoordinateSystem(axisLoc, axisRot, 32.0f);
}

/*
IsWalking
	Return true if we are walking... which at the moment is true so long as we're aiming.
*/
simulated function bool IsWalking()
{
	return (bWeaponAiming == true);
}

/*
IsRunning
	Return true if we are running... which at the moment is true so long as we're not aiming.
*/
simulated function bool IsRunning()
{
	return (bWeaponAiming == false);
}

/*
IsSprinting
	Return true if we have actually achieved the sprinting speed and are still on the ground
*/
simulated function bool IsSprinting()
{
	return (bIsSprinting && (VSize2D(Velocity) > 430));
}

/*
IsLongFall
	Return true if we are PHYS_Falling & bLongFall is true.
*/
simulated function bool IsLongFall()
{
	return ((Physics == PHYS_Falling) && bLongFall);
}

//================================================================================================================================================
// END HELPER FUNCTIONS
//================================================================================================================================================

/*
PostInitAnimTree
	Adds a lot more anim nodes & skeletal controllers...
*/
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	local AnimNodeSequenceBlendByAim AimSeqNode;
	local AnimNodeBlendDirectional DirectionalNode;
	local tfpAnimNodeSlotMirror SlotNode;
	local AnimNodeSequence AnimSeqNode;

	Super.PostInitAnimTree(SkelComp);

	if (SkelComp == Mesh)
	{
		GunAimAdjustNode = SkelControlSingleBone( mesh.FindSkelControl('GunAimAdjust') );
		HeadAimAdjustNode = SkelControlSingleBone( mesh.FindSkelControl('HeadAimAdjust') );
		GunSprintAdjust = SkelControlSingleBone( mesh.FindSkelControl('GunSprintAdjust') );
		WO_LeftHand = SkelControlSingleBone( mesh.FindSkelControl('WO_LeftHand') );
		WO_RightHand_Low = SkelControlSingleBone( mesh.FindSkelControl('WO_RightHand_Low') );
		WO_RightHand_LowCrouched = SkelControlSingleBone( mesh.FindSkelControl('WO_RightHand_LowCrouched') );
		WO_RightHand_High = SkelControlSingleBone( mesh.FindSkelControl('WO_RightHand_High') );

		foreach Mesh.AllAnimNodes(class'AnimNodeBlendDirectional', DirectionalNode)
			DirectionalNodes[DirectionalNodes.Length] = DirectionalNode;

		foreach Mesh.AllAnimNodes(class'tfpAnimNodeSlotMirror', SlotNode)
		{
			if (SlotNode.NodeName == 'LeftArmSlot')
				LeftArmAnimSlots[LeftArmAnimSlots.Length] = SlotNode;
			if (SlotNode.NodeName == 'RightArmSlot')
				RightArmAnimSlots[RightArmAnimSlots.Length] = SlotNode;
			if (SlotNode.NodeName == 'TorsoSlot')
				TorsoAnimSlots[TorsoAnimSlots.Length] = SlotNode;
		}

		foreach Mesh.AllAnimNodes(class'AnimNodeSequenceBlendByAim', AimSeqNode)
		{
			if (AimSeqNode.NodeName == 'Torso Offset')
				TorsoAimNodes[TorsoAimNodes.Length] = AimSeqNode;
		}

		JumpLeanNode = AnimNodeSequenceBlendByAim(Mesh.FindAnimNode('Jump Lean'));

		RightHandIK.BlendInTime = 0.0f;
		RightHandIK.BlendOutTime = 0.0f;

		`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName());

		foreach Mesh.AllAnimNodes(class'AnimNodeSequence', AnimSeqNode)
		{
			`log("AnimSeqNode:" @ AnimSeqNode @ "Name:" @ AnimSeqNode.NodeName);
			if (AnimSeqNode.NodeName == 'TorsoNode')
				TorsoNodes[TorsoNodes.Length] = AnimSeqNode;
		}
		
		`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "TorsoNodes.Length:" @ TorsoNodes.Length);
	}
}

/*
ClearCurrentPickupAttachment
	Clear the pickup attachment and set left/right shoulder weapon class (if applicable). Set by CurrentPickupChanged().
*/
simulated event ClearCurrentPickupAttachment()
{
	if (CurrentPickupAttachment != None)
	{
		if (CurrentPickupAttachment.PickupMesh != None)
		{
			Mesh.DetachComponent(CurrentPickupAttachment.PickupMesh);
			CurrentPickupAttachment.SetBase(None);
			CurrentPickupAttachment.SetHardAttach(False);
		}

		CurrentPickupAttachment.SetHidden(true);
		CurrentPickupAttachment.Destroy();
	}

	CurrentPickupAttachment = None;
}

/*
CurrentPickupChanged
	Player picked up an item - attach it to offhand and play an animation.
	Called from tfpInventoryManager::SetCurrentPickup() & tfpPawn::ReplicatedEvent().
	Network: ALL (Remote clients via replication)
*/
simulated function CurrentPickupChanged()
{
	// this shouldn't happen...
	if (CurrentPickupClass == None)
		return;
		
	// FIXME - why does this happen?
	if (CurrentPickupAttachment != None)
	{
		// Aready have a current pickup attachement of the same class... just return
		if (CurrentPickupAttachment.CurrentPickupClass == CurrentPickupClass)
			return;
		ClearCurrentPickupAttachment();
	}

	// we don't need to create an attachment on a dedicated server... who's gonna see it?
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		// Create the new Attachment.
		CurrentPickupAttachment = Spawn(class'tfpPickupAttachment',self);
		CurrentPickupAttachment.Instigator = self;
		CurrentPickupAttachment.Setup(CurrentPickupClass);
	}

	PlaySlotAnims(LeftArmAnimSlots, 'torso_pickup', TimeToPickup, true);
	SetTimer(TimeToPickup / 2, false, nameof(CheckPickup));
	SetTimer(TimeToPickup, false, nameof(PickupFinished));
}

/*
CheckPickup
	Clear the pickup attachment and set left/right shoulder weapon class (if applicable).
	Set by CurrentPickupChanged().
*/
simulated event CheckPickup()
{
	local class<UTWeapon> UTWC;
	
	ClearCurrentPickupAttachment();
	
	UTWC = class<UTWeapon>(CurrentPickupClass);
	
	if ((UTWC != None) && (UTWC.default.AttachmentClass != CurrentWeaponAttachmentClass)
	 && (UTWC.default.AttachmentClass != LeftShoulderWeaponAttachmentClass)
	  && (UTWC.default.AttachmentClass != RightShoulderWeaponAttachmentClass))
	{
		if (LeftShoulderWeaponAttachmentClass == None)
			LeftShoulderWeaponAttachmentClass = UTWC.default.AttachmentClass;
		else if (RightShoulderWeaponAttachmentClass == None)
			RightShoulderWeaponAttachmentClass = UTWC.default.AttachmentClass;

		ShoulderedWeaponChanged();
	}
}

/*
PickupFinished
	Player picked up an item and put it away, stop the animation.
	Set by CurrentPickupChanged().
*/
simulated function PickupFinished()
{
	CurrentPickupClass = None;

	// clear left arm animation
	StopPlaySlotAnims(LeftArmAnimSlots);
}


/*
SetPuttingDownWeapon
	Sets the value of bPuttingDownWeapon and plays any appropriate animations for the change
	Called from UTInventoryManager::SetPendingWeapon() & UTPawn::ReplicatedEvent()
	Network: ALL (Remote clients via replication)
*/
simulated function SetPuttingDownWeapon(bool bNowPuttingDownWeapon)
{
	local float TimeToChangeWeapons, BlendIn;

	Super.SetPuttingDownWeapon(bNowPuttingDownWeapon);

	if (!bPuttingDownWeapon)
		return;

	// stop aiming
	SetAimState(false);
	
	if (CurrentWeaponAttachment != None)
	{
		TimeToChangeWeapons += class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.PutDownTime;
		BlendIn = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.PutDownTime / 3;
	}
	else
	{
		TimeToChangeWeapons += 0.3f;
		BlendIn = 0.1f;
	}

	PlaySlotAnims(RightArmAnimSlots, 'torso_weapon_putaway', TimeToChangeWeapons, true, true, BlendIn, 0.1f);
	SetTimer(TimeToChangeWeapons + 0.25, false, nameof(ChangingWeaponsFinished));
}


/*
ChangingWeaponsFinished
	Player finished changing weapons, stop the animation. 
	Set by tfpPawn::SetPuttingDownWeapon() or tfpPawn::WeaponAttachmentChanged.
*/
simulated function ChangingWeaponsFinished()
{
	bPuttingDownWeapon = false;
	StopPlaySlotAnims(RightArmAnimSlots);
}


/*
ShoulderedWeaponChanged
	Called when there is a need to change the shouldered weapon attachment
	Network: ALL (Remote clients via replication)
*/
simulated function ShoulderedWeaponChanged()
{
	if ((LeftShoulderWeaponAttachment == None || LeftShoulderWeaponAttachment.Class != LeftShoulderWeaponAttachmentClass) && Mesh.SkeletalMesh != None)
	{
		// Detach/Destroy the current attachment if we have one
		if (LeftShoulderWeaponAttachment != None)
		{
			LeftShoulderWeaponAttachment.DetachFrom(Mesh);
			LeftShoulderWeaponAttachment.Destroy();
		}

		// Create the new Attachment.
		if (LeftShoulderWeaponAttachmentClass != None)
		{
			LeftShoulderWeaponAttachment = Spawn(LeftShoulderWeaponAttachmentClass, self);
			LeftShoulderWeaponAttachment.Instigator = self;
		}
		else
			LeftShoulderWeaponAttachment = None;

		// If all is good, attach it to the Pawn's Mesh.
		if (LeftShoulderWeaponAttachment != None)
		{
			LeftShoulderWeaponAttachment.Mesh.SetShadowParent(Mesh);
			LeftShoulderWeaponAttachment.Mesh.SetLightEnvironment(LightEnvironment);
			Mesh.AttachComponentToSocket(LeftShoulderWeaponAttachment.Mesh, LeftShoulderSocket);
			LeftShoulderWeaponAttachment.SetSkin(ReplicatedBodyMaterial);
			LeftShoulderWeaponAttachment.ChangeVisibility(bWeaponAttachmentVisible);
			LeftShoulderWeaponAttachment.GotoState('CurrentlyAttached');
		}
	}

	if ((RightShoulderWeaponAttachment == None || RightShoulderWeaponAttachment.Class != RightShoulderWeaponAttachmentClass) && Mesh.SkeletalMesh != None)
	{
		// Detach/Destroy the current attachment if we have one
		if (RightShoulderWeaponAttachment != None)
		{
			RightShoulderWeaponAttachment.DetachFrom(Mesh);
			RightShoulderWeaponAttachment.Destroy();
		}

		// Create the new Attachment.
		if (RightShoulderWeaponAttachmentClass != None)
		{
			RightShoulderWeaponAttachment = Spawn(RightShoulderWeaponAttachmentClass, self);
			RightShoulderWeaponAttachment.Instigator = self;
		}
		else
			RightShoulderWeaponAttachment = None;

		// If all is good, attach it to the Pawn's Mesh.
		if (RightShoulderWeaponAttachment != None)
		{
			RightShoulderWeaponAttachment.Mesh.SetShadowParent(Mesh);
			RightShoulderWeaponAttachment.Mesh.SetLightEnvironment(LightEnvironment);
			Mesh.AttachComponentToSocket(RightShoulderWeaponAttachment.Mesh, RightShoulderSocket);
			RightShoulderWeaponAttachment.SetSkin(ReplicatedBodyMaterial);
			RightShoulderWeaponAttachment.ChangeVisibility(bWeaponAttachmentVisible);
			RightShoulderWeaponAttachment.GotoState('CurrentlyAttached');
		}
	}
}

/*
CalcCamera
	KRIS - Updated to support TFP & other camera modes
*/
simulated function bool CalcCamera( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
{
	// Handle the fixed camera
	if (bFixedView)
	{
		out_CamLoc = FixedViewLoc;

		if (bFixedTracking)
		{
			out_CamRot = rotator((Location + BaseEyeHeight * vect(0,0,1)) - FixedViewLoc);
			FixedViewRot = out_CamRot;
		}
		else
			out_CamRot = FixedViewRot;

		//DrawEyeAxis();
	}
	else
	{
		// By default, we view through the Pawn's eyes..
		GetActorEyesViewPoint(out_CamLoc, out_CamRot);

		if (!IsFirstPerson())	// Handle BehindView
		{
			CalcThirdPersonCam(fDeltaTime, out_CamLoc, out_CamRot, out_FOV);
			//DrawEyeAxis();
		}
		
		if (UTWeapon(Weapon) != None)
			UTWeapon(Weapon).WeaponCalcCamera(fDeltaTime, out_CamLoc, out_CamRot);
	}

	return true;
}

/*
SetHeadVisibility
	Checks view mode to determine if head should be hidden or shown.
*/
simulated function SetHeadVisibility()
{
	local bool IsVisible;
	local tfpPlayerController tfpPC;
	
	tfpPC = tfpPlayerController(Controller);
	
	if (tfpPC != None)
		IsVisible = (tfpPC.bBehindView || tfpPC.bFixedView || tfpPC.bDebugFreeCam || tfpPC.bDetachedView);
	
	// Handle the HeadMesh visibility
	if (HeadMesh != None)
		HeadMesh.SetOwnerNoSee(!IsVisible);
}

/*
SetThirdPersonCamera
	KRIS - Updated to support TFP
*/
simulated function SetThirdPersonCamera(bool bNewBehindView)
{
	if (bNewBehindView)
	{
		CurrentCameraScale = 1.0;
		CameraZOffset = GetCollisionHeight() + Mesh.Translation.Z;
	}

	SetHeadVisibility();
}

/*
FixedView
	Based on the UTPawn version, updated to support tracking
	I like using this view a lot for testing.
*/
simulated function SetFixedView(bool bNewFixedview, optional bool bNewTracking = false)
{
	local float fov;

	if (WorldInfo.NetMode == NM_Standalone)
	{
		if (!bFixedView || !bFixedTracking)
			CalcCamera(0.0f, FixedViewLoc, FixedViewRot, fov);
	}
	
	bFixedView = bNewFixedview;
	bFixedTracking = (bNewTracking && bNewFixedview); // can't have fixed tracking without fixed view
	SetHeadVisibility();
}

/*
AdjustToWeaponSight
	Adjust our view location to line up with the axis of the weapon sights
	View location adjustments should be handled by the animation and sockets, not this funciton.
	All this does is correct for minor differences between the view location and sight location
	
	@param	out_Location	View Location
*/
simulated function AdjustToWeaponSight(out vector out_Location)
{
	local vector offsetViewLocation, sLoc, vDir, sDir;
	local float sLen, fRatio, DesiredFOV, DesiredAimFOV;
	local rotator sRot;
	local tfpPlayerController PC;
	
	// if we have no weapon, we're not human or not a client,
	// there is no need to adjust our viewpoint to match the weapons sight
	if ((CurrentWeaponAttachment == None) || (WorldInfo.NetMode == NM_DedicatedServer) || !IsHumanControlled() || !IsLocallyControlled())	
		return;

	if (!bWeaponAiming && (fChangeAimTime < WorldInfo.TimeSeconds))
		return;

	PC = tfpPlayerController(Controller);
	if (PC == None)
		return;
	
	// set out desired FOV to the default
	DesiredFOV = PC.DefaultFOV;
	
	// Set our DesiredAimFOV based on our current weapon.
	DesiredAimFOV = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.DesiredAimFOV;

	// Get the location and rotation of the sight socket from the weapons mesh
	CurrentWeaponAttachment.Mesh.GetSocketWorldLocationAndRotation('SightSocket', sLoc, sRot);

	// turn the sight rotator into a direction vector
	sDir = Normal(Vector(sRot));

	// get the direction vector from the sight to the current view (out_Location)
	vDir = Normal(sLoc - out_Location);

	// figure out the length from the sight we need to travel in order to be parallel to the current view
	sLen = (vDir dot sDir) * vsize(sLoc - out_Location);

	// take this length from the sight to give us the final offset view location
	// this is parallel to the current view location and will only shift to the right or left, not forward and backward.
	offsetViewLocation = sLoc - (sDir * sLen);
	//DrawDebugCoordinateSystem(offsetViewLocation, sRot, 32.0f);

	// if our aim status just changed, do a smooth change to the offset view location
	if (fChangeAimTime > WorldInfo.TimeSeconds)
	{
		fRatio = (fChangeAimTime - WorldInfo.TimeSeconds) / TimeToChangeAim;

		vDir = Normal(offsetViewLocation - out_Location);
		sLen = vsize(offsetViewLocation - out_Location);

		if (bWeaponAiming && (bWeaponObstructed == 0) && !IsLongFall() && (Physics != PHYS_Swimming))
		{
			out_Location += ((sLen * (1 - fRatio)) * vDir);
			DesiredFOV = DesiredAimFOV + ((PC.DefaultFOV - DesiredAimFOV) * fRatio);
		}
		else
		{
			out_Location += ((sLen * fRatio) * vDir);
			DesiredFOV = DesiredAimFOV + ((PC.DefaultFOV - DesiredAimFOV) * (1 - fRatio));
		}
	}
	else if (bWeaponAiming && (bWeaponObstructed == 0) && !IsLongFall() && (Physics != PHYS_Swimming))
	{
		out_Location = offsetViewLocation;
		DesiredFOV = DesiredAimFOV;
	}

	//DrawDebugCoordinateSystem(out_Location, sRot, 32.0f);
	if (bWinnerCam)
		DesiredFOV = PC.DefaultFOV;

	if (PC.DesiredFOV != DesiredFOV)
		PC.SetFOV(DesiredFOV);
}


/*
GetPawnViewLocation
	KRIS - Updated to support TFP & ADS
*/
simulated function Vector GetPawnViewLocation()
{
	local vector ViewLoc;

	// If we don't have an EyeSocket defined or we simply didn't find it, try the old way.
	// The engine will automatically complain about not finding the socket - no need to complain about it.
	if ((EyeSocket == '') || !Mesh.GetSocketWorldLocationAndRotation(EyeSocket, ViewLoc))
	{
		if (EyeSocket == '')
			AddOnScreenError("EyeSocket undefined");
		else
			AddOnScreenError("EyeSocket '"$EyeSocket$"' not found on Mesh "$Mesh);

		if (HeadBone == '')
			AddOnScreenError("HeadBone undefined");
		else
		{
			ViewLoc = (Mesh.GetBoneLocation(HeadBone) + Mesh.GetBoneAxis(HeadBone, AXIS_X) * HeadHeight);
			if (ViewLoc == vect(0,0,0))
				AddOnScreenError("HeadBone '"$HeadBone$"' not found on Mesh "$Mesh);
		}
		
		// Still failed?
		// Fall back to the UT3 way.
		if (ViewLoc == vect(0,0,0))
		{
			AddOnScreenError("Fallback view location in-use");
			ViewLoc = Location + BaseEyeHeight * vect(0,0,1);
		}
	}
	
	AdjustToWeaponSight(ViewLoc);

	return ViewLoc;
}

/*
GetViewRotation
	KRIS - Updated to support FaceAPI
*/
simulated event rotator GetViewRotation()
{
	local rotator ViewRot;
	local tfpPlayerController tfpC;
	
	tfpC = tfpPlayerController(Controller);

	if (tfpC != None)
	{
		ViewRot = tfpC.Rotation;
		if ((tfpPlayerInput(tfpC.PlayerInput) != None) && (tfpPlayerInput(tfpC.PlayerInput).FaceAPI != None))
			ViewRot += tfpPlayerInput(tfpC.PlayerInput).FaceAPI.ViewOffset;
		ViewRot = tfpPlayerController(Controller).LimitViewRotation(ViewRot, -16384, 16383);
		return ViewRot;
	}

	return Super.GetViewRotation();
}

/*
SetWalking
	KRIS - Used to toggle sprinting and set ground speed.
*/
event SetWalking(bool bNewIsWalking)
{
	local vector X, Y, Z, Dir;
	local bool bWasSprinting;

	bWasSprinting = bIsSprinting;

	if (bNewIsWalking != bWantsToSprint)
		bWantsToSprint = bNewIsWalking;

	// if don't want to sprint anymore, clear bNeedToReleaseSprint
	if (bNeedToReleaseSprint && !bWantsToSprint)
		bNeedToReleaseSprint = false;

	GetAxes(Rotation, X, Y, Z);
	Dir = Normal(Acceleration);

	// only switch to sprinting if not strafing and moving forward
	if (bWantsToSprint && !bNeedToReleaseSprint && (Physics == PHYS_Walking)
	 && !IsTimerActive('ChangingWeaponsFinished') && !IsTimerActive('PickupFinished') && (Abs(Y Dot Dir) < 0.5) && ((X Dot Dir) > 0))
		bIsSprinting = true;
	else
		bIsSprinting = false;

	// just starting sprinting?
	if (bIsSprinting && !bWasSprinting)
		// stop aiming
		SetAimState(false);
	
	if (bIsSprinting)
	{
		if (GroundSpeed != Default.GroundSpeed * 1.5)
			GroundSpeed = Default.GroundSpeed * 1.5;
	}
	else if (IsRunning())
	{
		if (GroundSpeed != Default.GroundSpeed)
			GroundSpeed = Default.GroundSpeed;
	}
	else if (GroundSpeed != Default.GroundSpeed * 0.35)
		GroundSpeed = Default.GroundSpeed * 0.35;
}



/*
UpdateLegsYaw
	KRIS - Updated to support different way of doing swimming
	FIXME - But is it better?
*/
simulated function FaceRotation(rotator NewRotation, float DeltaTime)
{
	if (Physics == PHYS_Ladder)
		NewRotation = OnLadder.Walldir;
	else if ((Physics == PHYS_Walking) || (Physics == PHYS_Falling) || (Physics == PHYS_Swimming))
		NewRotation.Pitch = 0;
		
	NewRotation.Roll = Rotation.Roll;
	SetRotation(NewRotation);
}

/*
=============================================================================
Tick

Tick based functions/hacks go here, obviously, coz this is the tick function.

Our 'TickGroup' is TG_PreAsyncWork - so we can call physics and the like no problem.

Network: SERVER / CLIENT
=============================================================================
*/

simulated function bool LegsFollowMovement()
{
	return (IsRunning() && !bIsCrouched);
}

simulated function bool ShouldCenterLegsToTorso()
{
	return (bWeaponAiming || bIsCrouched);
}

/*
UpdateLegsYaw
	Called via Tick().
	- Sets JumpLeanNode if falling.
	- Figures out yaw of the legs, based on physics, speed & direction
	- Sets any AnimNodeBlendDirectional nodes based on that information.
*/
simulated function UpdateLegsYaw(float DeltaTime)
{
	local int yawChange, newLegYaw, desiredLegYaw, i;
	local rotator rawRot;
	local vector X, Y, Z, Dir;
	local bool bBackwards;
	local float dnDirAngle;

	// base our raw rotation on GetBaseAimRotation(), because it takes our controller into account
	rawRot.Yaw = GetBaseAimRotation().Yaw;

	// how much did our yaw change since last time?
	yawChange = oldYaw - rawRot.Yaw;

	// setup our new legs offset yaw and normalise it
	newLegYaw = NormalizeRotAxis(LegsOffset.Yaw + yawChange);
	
	// by default, we want to center our legs
	desiredLegYaw = 0;

	// if we are swimming, re-center the legs to the torso
	if (Physics == PHYS_Swimming)
	{
		LegsTurning = 0;
		newLegYaw = 0;
	}
	// if we are falling, re-center the legs to the torso and lean into fall
	else if (Physics == PHYS_Falling)
	{
		// no turning in place while falling
		LegsTurning = 0;
		newLegYaw = 0;

		GetAxes(rawRot, X, Y, Z);
		Dir = Normal(Velocity);

		JumpLeanDir.X = (X Dot Dir); // forward
		JumpLeanDir.Y = (Y Dot Dir); // right

		// lean into the jump on the way up, lean away from the fall on the way down
		dnDirAngle = FClamp(Velocity.Z / Default.JumpZ, -1.0f, 1.0f);
		JumpLeanDir *= dnDirAngle;

		// X reflects the roll lef/right, which JumpLeanDir.Y holds
		// Y reflects the pitch forward/back, which JumpLeanDir.X holds
		// A tad confusing really... but there you go.
		JumpLeanNode.Aim.X = JumpLeanDir.Y;
		JumpLeanNode.Aim.Y = JumpLeanDir.X;
	}
	// legs are handled differently while moving
	else if (VSize2D(Velocity) != 0)
	{
		// no turning in place while moving
		LegsTurning = 0;

		//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "Vel2d:" @ VSize2D(Velocity) @ "Center:" @ ShouldCenterLegsToTorso() @ "Legs:" @ LegsFollowMovement());

		// When aiming, jumping and so forth, legs match torso angle.
		// Otherwise, legs will follow our movement angle.
		if (!ShouldCenterLegsToTorso() && LegsFollowMovement())
		{
		
			GetAxes(rawRot, X, Y, Z);
			Dir = Normal(Velocity);

			// if we're heading backwards ((X Dot Dir) < -0.5)), flip our side direction (Y Dot Dir)
			bBackwards = ((X Dot Dir) < -0.5);
			desiredLegYaw = ((Y Dot Dir) * (bBackwards ? -MaxYawLegsRun : MaxYawLegsRun));

			dnDirAngle = (abs(desiredLegYaw - newLegYaw) / 32768.0f) * PI;
			if (bBackwards)
				dnDirAngle = PI - (dnDirAngle * -1);
			
			// go through all the directional nodes and set dirangle
			for (i = 0; i < DirectionalNodes.length; i++)
				DirectionalNodes[i].DirAngle = dnDirAngle;
		}
	}
	else
	{
		// if we want to center our legs and torso (or they nearly are anyway), no point playing the turning in place animaitons
		if (ShouldCenterLegsToTorso() || ((abs(yawChange) < 10) && (abs(newLegYaw) < 1024)))
			LegsTurning = 0;
		// if we have turned too far, play the turning animation
		else if (Abs(newLegYaw) > MaxLegsYawIdle)
			LegsTurning = (newLegYaw > 0) ? -1 : 1;
		
		if (LegsTurning == 0)
			desiredLegYaw = newLegYaw;
	}

	// FIXME - since we're not limited players view rotation speed, limit the maximum difference to the leg yaw
	newLegYaw = ClampRotAxisFromBase(newLegYaw, 0, MaxYawLegsRun);

	// turn our legs back towards our desired leg yaw
	if (newLegYaw < desiredLegYaw)
		newLegYaw = Clamp(newLegYaw + (DeltaTime * MaxLegsYawChangePerSecond), newLegYaw, desiredLegYaw);
	else if (newLegYaw > desiredLegYaw)
		newLegYaw = Clamp(newLegYaw - (DeltaTime * MaxLegsYawChangePerSecond), desiredLegYaw, newLegYaw);
	
	// remember the new new legs yaw so we can offset our torso and twist the root bone accordingly
	// NOTE: animation tree requires a tfpAnimBlendByIdle animation node to set the correct root bone rotation
	LegsOffset.Yaw = newLegYaw;
	
	// remember our current yaw for next time
	oldYaw = rawRot.Yaw;	

	//DrawDebugCoordinateSystem(Location, rawRot, 32.0f);
	//DrawDebugCoordinateSystem(Location + vect(0,0,-32), rawRot + LegsOffset, 32.0f);
	//DrawEyeAxis();
}

/*
SetAimSeqNode
	Called via UpdateOffsetNodes().
*/
simulated function SetAimSeqNode(AnimNodeSequenceBlendByAim SeqNode, rotator oRot)
{
	SeqNode.Aim.Y = (float(oRot.Pitch) / ((oRot.Pitch > 0) ? ViewPitchMax : -ViewPitchMin));
	// FIXME - add the YawMaxRange variable???
	SeqNode.Aim.X = (float(oRot.Yaw) / 16384); // YawMaxRange);
}

/*
SyncTorsoAnimNodes
	Force our animation nodes to the same time as the server.
	Network: Client, via replication only.
*/
simulated function SyncTorsoAnimNodes()
{
	/*
	local int i;
	`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "RTNI - CurrentTime:" @ RTNI.CurrentTime @ "Index:" @ RTNI.Index);
	for (i = 0; i < TorsoNodes.length; i++)
	{
		if (TorsoNodes[i].bRelevant)
		{
			`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "LOC - CurrentTime:" @ TorsoNodes[i].CurrentTime @ "Index:" @ i);
			break;
		}
	}
	*/
	if (TorsoNodes[RTNI.Index].bRelevant)
	{
		// FIXME - This needs to be updated with to add a bit of an error margin & lerp, to prevent sudden jerks in the animation.
		if (TorsoNodes[RTNI.Index].CurrentTime != RTNI.CurrentTime)
			TorsoNodes[RTNI.Index].SetPosition(RTNI.CurrentTime, false);
	}
	
	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "NEW - CurrentTime:" @ TorsoNodes[RTNI.Index].CurrentTime);
}

/*
UpdateOffsetNodes
	Called via Tick().
	- Figures out yaw & pitch of the torso
	- Sets any torso AnimNodeSequenceBlendByAim based on that information.
*/
simulated function UpdateOffsetNodes()
{
	local rotator tOff;
	local int basePitch, i;
	//local float fRatio;

	basePitch = GetBaseAimRotation().Pitch;

	// If we're sprinting, torso pitch must be zero
	if (IsSprinting())
		tOff.Pitch = 0;
	else
		tOff.Pitch = basePitch + TorsoOffset.Pitch;

	tOff.Yaw = TorsoOffset.Yaw - LegsOffset.Yaw;

	tOff.Yaw = NormalizeRotAxis(tOff.Yaw);
	tOff.Pitch = NormalizeRotAxis(tOff.Pitch);

	// now go through all the torso seq nodes and set their aim values
	for (i = 0; i < TorsoAimNodes.length; i++)
		SetAimSeqNode(TorsoAimNodes[i], tOff);

	// If we're the server, find the relevant torso nodes, then record the time & index.
	// This will be replicated to all client to make sure they stay in sync.
	// FIXME - Need to worry about blends at all? 
	//			Should this just be the movement group sync time?
	if (Role == Role_Authority)
	{
		for (i = 0; i < TorsoNodes.length; i++)
		{
			if (TorsoNodes[i].bRelevant)
			{
				RTNI.CurrentTime = TorsoNodes[i].CurrentTime;
				RTNI.Index = i;
				break;
			}
		}
	}
}

/*
WaterJumpEnd
	If its been a little while since we starting jumping out of the water, check the situation.
*/
simulated function WaterJumpEnd()
{
	bUpAndOut = false;

	// Something isn't right here... we're still in the water!
	if (PhysicsVolume.bWaterVolume)
		SetPhysics(PHYS_Swimming);
}

/*
UpdateWaterLevel
	Called via Tick().
	Correct position of player while in water.
	Stops the jerking up & down crap with default swimmming as the player changes from Swimming to Falling quickly.
	FIXME - Is this needed for bots? If not, move to player controller?
*/
simulated function UpdateWaterLevel()
{
	local vector HitNormal, Start, End, WaterLevel;
	local TraceHitInfo HitInfo;
	local actor HitActor;
	local vector X, Y, Z;

	// If CheckWaterJump() was successful earlier, bUpAndOut will be true
	if (bUpAndOut)
	{
		// Keep going up!
		if (PhysicsVolume.bWaterVolume)
			Velocity.Z = OutofWaterZ;
		return;
	}

	// Not swimming? You shall not pass!
	if (Physics != PHYS_Swimming)
		return;
	
	// turn off the left hand IK
	SetHandIK();
	
	GetAxes(Rotation, X, Y, Z);
	
	if (((X Dot Acceleration) > 0) // If we want to move forward...
		&& (bJumpAtWaterLevel || (Acceleration.Z > 0)// and we want to move up..
		 || (GetBaseAimRotation().Pitch > 2048))) // or we're aiming up..
	{
		// ... see if its clear to get the f@#k out of this pool!
		if (CheckWaterJump(HitNormal))
		{
			// Set velocity, bUpAndOut etc
			SetPhysics(PHYS_Falling);
			WaterJumpDir = X;
			JumpOutOfWater(HitNormal);
			SetTimer(WaterJumpTime, false, nameof(WaterJumpEnd));
			//`log(self$" UpdateWaterLevel() : CheckWaterJump passed, Velocity.Z = "$Velocity.Z);
			return;
		}
	}
	
	// Find the top of this water volume.
	Start = Location;
	Start.Z += GetCollisionHeight();
	End = Location;
	End.Z -= GetCollisionHeight() * 1.5;

	HitActor = Trace(WaterLevel, HitNormal, End, Start, false,, HitInfo, TRACEFLAG_PhysicsVolumes);

	// If we didn't hit a water volume, stop.
	if (WaterVolume(HitActor) == None)
		return;
		
	DrawDebugLine(Start, WaterLevel, 255, 0, 0, false);
	WaterLevel.Z += WaterLevelOffsetZ;

	// If our location is higher the adjusted water level, we're at the water level.
	// This stops us flying out of the water, becoming PHYS_Flying, changing animations, 
	// then hitting the water again, becoming PHYS_Swimming and looping back again.
	if (Location.Z >= WaterLevel.Z)
	{
		bAtWaterLevel = true;
		// While the controller won't allow any more upwards Acceleration, 
		// we still need to clear any velocity left on the Pawn.
		if (Velocity.Z > 0.0f)
			Velocity.Z = 0.0f;
	}
	else
		bAtWaterLevel = false;
}

/*
FinishMantling
	If its been a little while since we starting mantling, check the situation.
*/
simulated function FinishMantling()
{
	bMantling = false;
}

/*
MantleUp
*/
function MantleUp(vector JumpDir)
{
	bReadyToDoubleJump = true;
	bDodging = false;
	Falling();
	Velocity = JumpDir * WaterSpeed;
	Acceleration = JumpDir * AccelRate;
	// Set here so physics uses this for remainder of tick
	Velocity.Z = OutofWaterZ;
	bMantling = true;
}

/*
CheckMantle
	Called via Tick().
*/
simulated function CheckMantle()
{
	local vector HitNormal;
	local vector X, Y, Z;

	// If we're swimming, skip this.
	if (bUpAndOut || (Physics == PHYS_Swimming))
		return;
		
	// If CheckWaterJump() was successful earlier, bMantling will be true
	if (bMantling)
	{
		// Keep going up!
		if (Location.Z <= MantleZ)
			Velocity.Z = OutofWaterZ;
		return;
	}

	// Not swimming? You shall not pass!
	if (Physics != PHYS_Falling)
		return;
	
	GetAxes(Rotation, X, Y, Z);
	
	if (((X Dot Acceleration) > 0) // If we want to move forward...
		&& ((Acceleration.Z > 0)// and we want to move up..
		 || (GetBaseAimRotation().Pitch > 2048))) // or we're aiming up..
	{
		// ... see if its clear to get the f@#k out of this pool!
		if (CheckWaterJump(HitNormal))
		{
			MantleZ = Location.Z + MaxOutOfWaterStepHeight;

			// Set velocity, bMantling etc
			SetPhysics(PHYS_Falling);
			MantleJumpDir = X;
			MantleUp(HitNormal);
			SetTimer(WaterJumpTime, false, nameof(FinishMantling));
			//`log(self$" CheckMantle() : CheckWaterJump passed, Velocity.Z = "$Velocity.Z);
			return;
		}
	}
}

/*
CheckDelayFire
	Called via Tick().
	Look for situations that would stop the playing being able to maintain aim etc.
*/
simulated function CheckDelayFire()
{
	if ((fDelayStartFire == 0.0f) || (fDelayStartFire > WorldInfo.TimeSeconds))
		return;

	fDelayStartFire = 0;
	if (bWantsToFire)
		StartFire(0);
}

/*
CheckSprinting
	Called via Tick().
	Controls GunSprintAdjust node strengths
*/
simulated function CheckSprinting()
{	
	// just starting sprinting?
	if (GunSprintAdjust != None)
	{
		if (bIsSprinting && (GunSprintAdjust.ControlStrength == 0.0f))
			GunSprintAdjust.SetSkelControlStrength(1.0f, TimeToChangeAim);
		// just ended sprinting?
		else if (!bIsSprinting && (GunSprintAdjust.ControlStrength == 1.0f))
			GunSprintAdjust.SetSkelControlStrength(0.0f, TimeToChangeAim);
	}
}

/*
CheckAiming
	Called via Tick().
	Look for situations that would stop the playing being able to maintain aim etc.
*/
simulated function CheckAiming()
{
	// are we aiming?
	if (bWeaponAiming)
	{
		// if we falling a great distance or swimming, we can't maintain our aim!
		if (IsLongFall() || (Physics == PHYS_Swimming))
			SetAimState(false);
	}

	bOldWeaponAiming = bWeaponAiming;
}

/*
Tick
	Called if bScriptTickSpecial is set.
	This tick function is called after physics has executed
*/
simulated function Tick(float DeltaTime)
{
	// correct for water jerkyness
	UpdateWaterLevel();
	
	//CheckMantle();

	UpdateWeaponObstructed();

	// client/local player, do this
	if (Role < Role_Authority)
	{
		// check to see if we were trying to fire when we weren't allowed too
		CheckDelayFire();
	}

	// set the sprinting skeletal controller
	CheckSprinting();

	// see if we need to stop aiming for some reason outside of the players control
	CheckAiming();
	
	// update the yaw of our legs
	UpdateLegsYaw(DeltaTime);

	// update our offset nodes
	UpdateOffsetNodes();
}

/*
SetLongFall
	Timer set by CheckLongFall().
*/
simulated function SetLongFall()
{
	bLongFall = true;
	SetHandIK();
}

/*
CheckLongFall
	Called by TickSpecial().
*/
simulated function CheckLongFall()
{
	// if we're falling, set a timer to setup a 'long fall'
	if ((Physics == PHYS_Falling) && !IsTimerActive('SetLongFall'))
	{
		SetTimer(LongFallTime, false, nameof(SetLongFall));
	}
	else if ((Physics != PHYS_Falling) && IsTimerActive('SetLongFall'))
	{
		ClearTimer('SetLongFall');
		bLongFall = false;
		SetHandIK();
	}
}

/*
TickSpecial
	Called if bScriptTickSpecial is set.
	This tick function is called after physics has executed
*/
simulated function TickSpecial( float DeltaTime )
{
	CheckLongFall();

	// client/local player, do this
	if (Role < Role_Authority)
	{
		CheckAirMovingPastEars();
	}
	
	bOldIsCrouched = bIsCrouched;

	FootPlacement(DeltaTime);
}

/*
CheckAirMovingPastEars
	FIXME - My crappy attempt at playing a air whooshing by ears sound
*/
simulated function CheckAirMovingPastEars()
{
	local bool Playing, ShouldStart, ShouldEnd;
	
	if (AirMovingPastEarsSound == None)
		return;

	Playing = AirMovingPastEarsSound.IsPlaying();

	ShouldStart = !Playing && (bIsSprinting || IsLongFall());
	ShouldEnd = Playing && !bIsSprinting && !IsLongFall();

	if (ShouldStart && !AirMovingPastEarsSound.IsFadingIn())
		AirMovingPastEarsSound.FadeIn(2.0f, 1.0f);
	else if (ShouldEnd && !AirMovingPastEarsSound.IsFadingOut())
		AirMovingPastEarsSound.FadeOut(0.5f, 0.0f);
}

/*
PossessedBy
	KRIS:
		- Removed call to NotifyTeamChanged()
		- Added check to recreate weapon attachment
*/
function PossessedBy(Controller C, bool bVehicleTransition)
{
	Super(Pawn).PossessedBy(C, bVehicleTransition);

	if (CurrentWeaponAttachmentClass != None)
	{
		// recreate weapon attachment in case the socket on the new mesh is in a different place
		if (CurrentWeaponAttachment != None)
		{
			CurrentWeaponAttachment.DetachFrom(Mesh);
			CurrentWeaponAttachment.Destroy();
			CurrentWeaponAttachment = None;
		}
		WeaponAttachmentChanged();
	}	
}

/*
PlayFootStepSound
	KRIS - Removed first person check, since it is no longer required.
*/
simulated event PlayFootStepSound(int FootDown)
{
	local PlayerController PC;
	
	ForEach LocalPlayerControllers(class'PlayerController', PC)
	{
		if ((PC.ViewTarget != None) && (VSizeSq(PC.ViewTarget.Location - Location) < MaxFootstepDistSq))
		{
			ActuallyPlayFootstepSound(FootDown);
			return;
		}
	}
}

/*
WeaponFired
	Called when a pawn's weapon has fired and is responsibile for
	delegating the creation of all of the different effects.

	bViaReplication denotes if this call in as the result of the
	flashcount/flashlocation being replicated. It's used filter out
	when to make the effects.
	Network: ALL
	
	KRIS - Removed first person check, since it is no longer required.
*/
simulated function WeaponFired(Weapon InWeapon, bool bViaReplication, optional vector HitLocation)
{
	if (CurrentWeaponAttachment == None)
		return;
	
	CurrentWeaponAttachment.ThirdPersonFireEffects(HitLocation);

	if ((HitLocation != Vect(0,0,0)) && ((WorldInfo.NetMode == NM_ListenServer) || (WorldInfo.NetMode == NM_Standalone) || bViaReplication))
		CurrentWeaponAttachment.PlayImpactEffects(HitLocation);
}


/*
PlayWeaponSwitch
	Player just changed weapon.
	Called from InventoryManager::ChangedWeapon().
	Network: Local Player and Server.
 	@param	OldWeapon	Old weapon held by Pawn.
	@param	NewWeapon	New weapon held by Pawn.
*/
simulated function PlayWeaponSwitch(Weapon OldWeapon, Weapon NewWeapon)
{
	local UTWeapon NewUTW, OldUTW;
	local bool bShoulderedOldWeapon;

	NewUTW = UTWeapon(NewWeapon);
	OldUTW = UTWeapon(OldWeapon);

	if (NewUTW != None)
	{
		if (LeftShoulderWeaponAttachmentClass == NewUTW.AttachmentClass)
		{
			LeftShoulderWeaponAttachmentClass = None;
			if (RightShoulderWeaponAttachmentClass == None)
			{
				RightShoulderWeaponAttachmentClass = OldUTW.AttachmentClass;
				bShoulderedOldWeapon = true;
			}
		}
		else if (RightShoulderWeaponAttachmentClass == NewUTW.AttachmentClass)
		{
			RightShoulderWeaponAttachmentClass = None;
			if (LeftShoulderWeaponAttachmentClass == None)
			{
				LeftShoulderWeaponAttachmentClass = OldUTW.AttachmentClass;
				bShoulderedOldWeapon = true;
			}
		}
		
		CurrentWeaponAttachmentClass = NewUTW.AttachmentClass;
	}

	if ((OldUTW != None) && !bShoulderedOldWeapon)
	{
		if (LeftShoulderWeaponAttachmentClass == None)
			LeftShoulderWeaponAttachmentClass = OldUTW.AttachmentClass;
		else if (RightShoulderWeaponAttachmentClass == None)
			RightShoulderWeaponAttachmentClass = OldUTW.AttachmentClass;
	}

	WeaponAttachmentChanged();
	ShoulderedWeaponChanged();
}

/*
BecomeViewTarget
	Called by Camera when this actor becomes its ViewTarget

	No longer attaches arm meshes (we don't use them).
	No longer sets bUpdateEyeHeight to true (coz we don't).
*/
simulated event BecomeViewTarget( PlayerController PC )
{
	Super(GamePawn).BecomeViewTarget(PC);

	if (LocalPlayer(PC.Player) != None)
	{
		PawnAmbientSound.bAllowSpatialization = false;
		WeaponAmbientSound.bAllowSpatialization = false;
		SetWeaponVisibility(false);
		bUpdateEyeHeight = false;
	}
}

/*
SetWeaponVisibility
	KRIS - Overridden to always hide the weapon mesh, set or otherwise
*/
simulated function SwitchWeapon(byte NewGroup)
{
	if (NewGroup == 0 && bHasHoverboard && DrivenVehicle == None)
	{
		if (WorldInfo.TimeSeconds - LastHoverboardTime > MinHoverboardInterval)
		{
			ServerHoverboard();
			LastHoverboardTime = WorldInfo.TimeSeconds;
		}
		return;
	}

	if (UTInventoryManager(InvManager) != None)
	{
		UTInventoryManager(InvManager).SwitchWeapon(NewGroup);
	}

	SetWeaponVisibility(false);
}

/*
SetWeaponVisibility
	KRIS - Overridden to always hide the weapon mesh, set or otherwise
*/
simulated function SetWeaponVisibility(bool bWeaponVisible)
{
	Super.SetWeaponVisibility(false);
}

/*
GetAdjustedAimFor
	Returns the muzzle direction of our current weapon attachement.
	FIXME - Send to contoller and update there to allow for aim assist etc?
*/
simulated function Rotator GetAdjustedAimFor( Weapon W, vector StartFireLoc )
{
	local vector MuzVec;
	local rotator MuzRot;
	
	if (CurrentWeaponAttachment == None)
		return GetBaseAimRotation();

	CurrentWeaponAttachment.Mesh.GetSocketWorldLocationAndRotation(CurrentWeaponAttachment.MuzzleFlashSocket, MuzVec, MuzRot);

	return MuzRot;
}

/*
GetWeaponStartTraceLocation
	KRIS - updated to return the actual muzzle flash location of the current weapon attachment
*/
simulated event Vector GetWeaponStartTraceLocation(optional Weapon CurrentWeapon)
{
	if (CurrentWeaponAttachment != None)
		return CurrentWeaponAttachment.GetEffectLocation();

	// If we have no controller, we simply traces from pawn eyes location
	return GetPawnViewLocation();
}

/*
GetBaseAimRotation
	Network: Local Player
*/
simulated singular event Rotator GetBaseAimRotation()
{
	local vector	/*POVLoc,*/ FocalPoint, wLoc;
	local rotator	POVRot;
	local float vLen;
	local tfpPlayerController tfpPC;

	tfpPC = tfpPlayerController(Controller);

	// If we have a controller, by default we aim at the player's 'eyes' direction
	// that is by default Controller.Rotation for AI, and camera (crosshair) rotation for human players.
	if (!bFixedView && (Controller != None) && ((tfpPC == None) || (!tfpPC.bDebugFreeCam && !tfpPC.bDetachedView)))
	{
		POVRot = Controller.Rotation;
		
		//@FIXME: eventually bot Rotation.Pitch will be nonzero?
		if (UTBot(Controller) != None)
		{
			FocalPoint = Controller.GetFocalPoint();
			
			if (CurrentWeaponAttachment != None)
			{
				wLoc = CurrentWeaponAttachment.GetEffectLocation();
				FocalPoint.Z -= (wLoc.Z - Location.Z);
			}
			else
				wLoc = Location;

			vLen = vsize(FocalPoint - wLoc);
			
			//POVRot.Pitch = rotator(Controller.GetFocalPoint() - Location).Pitch;
			
			// HACK - fix weapon aim
			if (Weapon != None)
			{
				if (Weapon.IsA('tfpWeap_LinkGun'))
					FocalPoint.Z -= Clamp(32 * (vLen / 256), 0, 32);
				else if (Weapon.IsA('tfpWeap_ShockRifle'))
					FocalPoint.Z -= Clamp(16 * (vLen / 256), 0, 16);
			}
			
			POVRot.Pitch = rotator(FocalPoint - Location).Pitch;
		}
		
		return POVRot;
	}

	// If we have no controller, we simply use our rotation
	POVRot = Rotation;

	// If our Pitch is 0, then use RemoveViewPitch
	if (POVRot.Pitch == 0)
		POVRot.Pitch = RemoteViewPitch << 8;

	return POVRot;
}

/*
SetAimState
	Network: ALL (Remote clients via replication)
*/
simulated function SetAimState(bool bAimState)
{
	local float fStrength;
	
	// Set the boolean value.
	bWeaponAiming = bAimState;
	
	// Blend the skeletal controllers in/out.
	// This should really be proper animations instead of skeletal controllers, but meh...
	fStrength = (bAimState ? 1.0f : 0.0f);
	GunAimAdjustNode.SetSkelControlStrength(fStrength, TimeToChangeAim);
	HeadAimAdjustNode.SetSkelControlStrength(fStrength, TimeToChangeAim);

	// if our aiming state has changed, set the aim time to so we can smoothly change our camera position & fov.
	if (bWeaponAiming != bOldWeaponAiming)
		fChangeAimTime = WorldInfo.TimeSeconds + TimeToChangeAim;

	// Set the need to release sprinting if we still want to sprint.
	if (bWantsToSprint)
		bNeedToReleaseSprint = bAimState;

	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "bWeaponAiming:" @ bWeaponAiming @ "fChangeAimTime: " @ fChangeAimTime @ "fStrength:" @ fStrength );
}

/*
ServerToggleAim
	When ToggleAim() is called on a client, it replicates the start by calling ServerToggleAim().
	This begins the event on server.
	Server side actors (such as bots) should not call ServerToggleAim() directly and should instead call ToggleAim().
 
	Network: Dedicated Server only, or Listen Server for remote clients.
*/
reliable server function ServerToggleAim()
{
	ToggleAim();
}

/*
ToggleAim
	Called on the LocalPlayer, ToggleAim sends the aim request to the server (ServerToggleAim)
	Call path: PlayerController::StopFire(1) -> Pawn::StopFire(1) -> tfpPawn::ToggleAim()
	Network: LocalPlayer
*/
simulated function ToggleAim()
{
	if ((GunAimAdjustNode == None) || (CurrentWeaponAttachment == None) || IsLongFall() || (Physics == PHYS_Swimming))
		return;

	bWeaponAiming = !bWeaponAiming;
	SetAimState(bWeaponAiming);

	// if client (non-authorive), call server
	if (Role < Role_Authority)
		ServerToggleAim();
}

/*
StartFire
	KRIS - Updated to support aiming, sprinting & what not
	Network: Local Player
*/
simulated function StartFire(byte FireModeNum)
{
	if (FireModeNum != 1)
		bWantsToFire = true;

	if ((fDelayStartFire > WorldInfo.TimeSeconds) || (bWeaponObstructed != 0))
		return;
		
	// if the button is currently down...
	if (FireModeNum != 1)
		Super.StartFire(FireModeNum);
}

/*
StopFire
	KRIS - Updated to support aiming, sprinting & what not
	Network: Local Player
*/
simulated function StopFire(byte FireModeNum)
{
	if (FireModeNum != 1)
		bWantsToFire = false;

	if (fDelayStartFire > WorldInfo.TimeSeconds)
		return;

	// toggle aim on release, if we weren't holding it down (which is something else again)
	if ((Weapon != None) && (FireModeNum == 1) && !bNoWeaponFiring)
	{
		ToggleAim();
		return;
	}
	
	Super.StopFire(FireModeNum);
}

/*
ClearPlayerAnimSets
	Resets the meshes animation sets to their default value
*/
simulated function ClearPlayerAnimSets()
{
	// as far as I know, this can't fail
	RestoreAnimSetsToDefault();
	Mesh.UpdateAnimations();
}

/*
AddPlayerAnimSets
	@param PlayerAnimSets - adds any listed here to the meshes animsets
*/
simulated function AddPlayerAnimSets(array<AnimSet> PlayerAnimSets)
{
	local int i;

	// as far as I know, this can't fail
	RestoreAnimSetsToDefault();

	for (i = 0; i < PlayerAnimSets.length; i++)
		Mesh.AnimSets[Mesh.AnimSets.Length] = PlayerAnimSets[i];

	Mesh.UpdateAnimations();
}

/*
WeaponAttachmentChanged
	KRIS - Updated to support TFP
	Called when there is a need to change the weapon attachment
	Network: ALL (Remote clients via replication)
*/
simulated function WeaponAttachmentChanged()
{
	local float EquipTime;
	
	Super.WeaponAttachmentChanged();

	if ((CurrentWeaponAttachment != None) && (class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass) != None))
	{
		// add the player anim sets (new way of doing aiming etc).
		AddPlayerAnimSets(class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.PlayerAnimSets);

		EquipTime = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.EquipTime;

		// play a take out animation
		PlaySlotAnims(RightArmAnimSlots, 'torso_weapon_takeout', EquipTime, true, true, 0.0f, EquipTime / 2);
		SetTimer(EquipTime, false, nameof(ChangingWeaponsFinished));
		
		// setup all the skeletal controller offsets etc.
		GunAimAdjustNode.BoneTranslation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.aimOffset;

		GunSprintAdjust.BoneTranslation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.SprintTrans;
		GunSprintAdjust.BoneRotation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.SprintRot;

		WO_RightHand_Low.BoneTranslation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.obLowTrans;
		WO_RightHand_Low.BoneRotation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.obLowRot;

		WO_RightHand_LowCrouched.BoneTranslation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.obLowCrouchTrans;
		WO_RightHand_LowCrouched.BoneRotation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.obLowCrouchRot;

		WO_RightHand_High.BoneTranslation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.obHighTrans;
		WO_RightHand_High.BoneRotation = class<tfpWeapon>(CurrentWeaponAttachment.WeaponClass).default.obHighRot;
	}
}

/*
WeaponChanged
	KRIS - FIXME - all this really does now is play the weapon equip sound... remove it?
*/
simulated function WeaponChanged(UTWeapon NewWeapon)
{
	// Make sure the new weapon respects behindview
	if (NewWeapon != None)
		NewWeapon.PlayWeaponEquip();
}


/*
ThrowWeaponOnDeath
	KRIS - Updated to drop shouldered weapons
*/
function ThrowWeaponOnDeath()
{
	local Inventory Inv;
	
	// Actually throw the weapon
	if (Weapon != None)
		TossInventory(Weapon);

	if (RightShoulderWeaponAttachmentClass != None)
	{
		Inv = UTInventoryManager(InvManager).HasInventoryOfClass(RightShoulderWeaponAttachmentClass.default.WeaponClass);

		if (Inv != None)
			TossInventory(Inv, Velocity + vect(0,0,1));

		RightShoulderWeaponAttachmentClass = None;
	}
	
	if (LeftShoulderWeaponAttachmentClass != None)
	{
		Inv = UTInventoryManager(InvManager).HasInventoryOfClass(LeftShoulderWeaponAttachmentClass.default.WeaponClass);
		if (Inv != None)
			TossInventory(Inv, Velocity + vect(0,0,1));

		LeftShoulderWeaponAttachmentClass = None;
	}
}

/*
PlayDying
	KRIS - Clears shouldered weapons & aiming
*/
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	// make sure I don't have an active shoulder weapon attachments
	RightShoulderWeaponAttachmentClass = None;
	LeftShoulderWeaponAttachmentClass = None;
	ShoulderedWeaponChanged();

	// stop aiming
	SetAimState(false);

	
	Super.PlayDying(DamageType, HitLoc);
}

/*
Dying
	Updated to not force third person and to match the players view to the head rotation
*/
simulated State Dying
{
	event bool EncroachingOn(Actor Other)
	{
		// don't abort moves in ragdoll
		return false;
	}

	simulated function bool CalcCamera( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
	{
		local class<UTDamageType> UTDamage;

		UTDamage = class<UTDamageType>(HitDamageType);

		if (UTDamage == None || !UTDamage.default.bSpecialDeathCamera)
			return Global.CalcCamera(fDeltaTime, out_CamLoc, out_CamRot, out_FOV);

		UTDamage.static.CalcDeathCamera(self, fDeltaTime, out_CamLoc, out_CamRot, out_FOV);
		return true;
	}
	
	simulated event rotator GetViewRotation()
	{
		local vector out_Loc;
		local rotator out_Rot;

		if (EyeSocket != '')
			Mesh.GetSocketWorldLocationAndRotation(EyeSocket, out_Loc, out_Rot);

		return out_Rot;
	}	

	event Timer()
	{
	}
}

/*
CheckWeaponCollision
	Do a trace from the edge of the players collision to the end of the weapon and see if it hits something.
*/
simulated function CheckWeaponCollision()
{
	local vector HitLocation, HitNormal, TraceStart, TraceEnd, MuzLoc, HandLoc, wExtent, X, Y, Z;
	local float eSize, Pitch;
	local rotator HandRot;
	local Actor	 HitActor;

	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ GetEnum(enum'ENetRole', Role) @ self @ GetFuncName() @ "bWeaponObstructed:" @ bWeaponObstructed);

	// If we're doing something which we don't want or need to check for weapon collision, skip it.
	if ((CurrentWeaponAttachment == None) || bIsSprinting || (DrivenVehicle != None)
	 || IsTimerActive('ChangingWeaponsFinished') ||  IsTimerActive('PickupFinished'))
	{
		if (bWeaponObstructed != 0)
		{
			bWeaponObstructed = 0;
			LastWCWith = None;
		}
		return;
	}

	// Hit something earlier, still waiting to check again.
	if (fLastWCTime > WorldInfo.TimeSeconds)
		return;
		
	eSize = 6.0f;
	wExtent.X = eSize;
	wExtent.Y = eSize;

	//`log("Pitch:" @ (AimRot.Pitch > 18000) ? AimRot.Pitch - 65535 : AimRot.Pitch);

	// Change duck state, check to see if we need to swap skeletal controllers.
	if (bOldIsCrouched != bIsCrouched)
	{
		if ((bWeaponObstructed == 1) && bIsCrouched)
			bWeaponObstructed = 2;
		else if ((bWeaponObstructed == 2) && !bIsCrouched)
			bWeaponObstructed = 1;
	}

	/*
	 When our weapon hits something, it goes into an 'obstructed' position.
	 However, the right hand IK bone remains in the same position, as if our weapon had never hit anything.
	 Using this, we can figure out where our weapon should be if it wasn't obstructed, and check the area.

	 This demo uses a skeletal controller for the 'obstructed' position, but an animation would work and look much better.
	*/
	
	// Get the muzzle location of our weapon in local coords.
	CurrentWeaponAttachment.Mesh.GetSocketWorldLocationAndRotation(CurrentWeaponAttachment.MuzzleFlashSocket, MuzLoc, , 1);

	// Get the location & rotation of a special socket attached to the IK bone for the right hand.
	Mesh.GetSocketWorldLocationAndRotation(IK_WeaponSocket, HandLoc, HandRot);

	// Figure out the axes based on the this special socket.
	GetAxes(HandRot, X, Y, Z);
	
	// Using the local muzzle coords, we can figure out where the weapon *should* be.
	TraceStart = HandLoc + (MuzLoc.X * X) + (MuzLoc.Z * Z);
	TraceEnd = TraceStart + (MuzLoc.Y * Y);

	// Now that we know where our weapon should be, check this location.
	HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true, wExtent);
	
	// Hit something?
	if (HitActor != None)
	{
		DrawDebugCylinder(TraceStart, TraceEnd, eSize, 4, 255, 0, 0);
		Pitch = GetBaseAimRotation().Pitch;
		if (Pitch > 18000)
			Pitch -= 65535;
		
		// Set bWeaponObstructed.
		if ((Pitch > 2000) || (bWeaponObstructed == 3))
			bWeaponObstructed = 3;
		else
			bWeaponObstructed = (bIsCrouched ? 2 : 1);

		// Remember who obstructed our weapon (for AI).
		if (LastWCWith != HitActor)
			LastWCWith = HitActor;
			
		// We've collided with something.
		// Slow down our checks until we're clear again.
		fLastWCTime = WorldInfo.TimeSeconds + TimeToChangeAim;
		return;
	}

	DrawDebugCylinder(TraceStart, TraceEnd, eSize, 4, 0, 255, 0);

	// Didn't hit anything?
	if (bWeaponObstructed != 0)
	{
		// Clear bWeaponObstructed.
		bWeaponObstructed = 0;
		LastWCWith = None;
	}
}

/*
UpdateWeaponObstructed
	Handle the skeletal controllers that control weapon placement when obstructed
*/
simulated function UpdateWeaponObstructed()
{
	local bool oldWantsToFire;

	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ GetEnum(enum'ENetRole', Role) @ self @ GetFuncName() @ "bWeaponObstructed:" @ bWeaponObstructed);
	
	if ((Role == Role_Authority) || IsLocallyControlled())
		CheckWeaponCollision();

	//`log(self @ GetFuncName() @ "bWeaponObstructed:" @ bWeaponObstructed @ "oldWeaponObstructed:" @oldWeaponObstructed);

	if (oldWeaponObstructed == bWeaponObstructed)
		return; // nothing has changed
	
	// if we are aiming, set the aim time to so we can smoothly change our camera position & fov.
	if (bWeaponAiming)
		fChangeAimTime = WorldInfo.TimeSeconds + TimeToChangeAim;

	if (oldWeaponObstructed == 1)
		WO_RightHand_Low.SetSkelControlStrength(0.0f, TimeToChangeAim);
	else if (oldWeaponObstructed == 2)
		WO_RightHand_LowCrouched.SetSkelControlStrength(0.0f, TimeToChangeAim);
	else if (oldWeaponObstructed == 3)
		WO_RightHand_High.SetSkelControlStrength(0.0f, TimeToChangeAim);
			
	if (bWeaponObstructed != 0)
	{
		WO_LeftHand.SetSkelControlStrength(1.0f, TimeToChangeAim);
		
		if (bWeaponObstructed == 1)
			WO_RightHand_Low.SetSkelControlStrength(1.0f, TimeToChangeAim);
		else if (bWeaponObstructed == 2)
			WO_RightHand_LowCrouched.SetSkelControlStrength(1.0f, TimeToChangeAim);
		else if (bWeaponObstructed == 3)
			WO_RightHand_High.SetSkelControlStrength(1.0f, TimeToChangeAim);
			
		oldWantsToFire = bWantsToFire;
		StopFire(0);
		bWantsToFire = oldWantsToFire;
	}
	else
		WO_LeftHand.SetSkelControlStrength(0.0f, TimeToChangeAim);

	// must be set after StopFire(0) call
	fDelayStartFire = WorldInfo.TimeSeconds + TimeToChangeAim;

	oldWeaponObstructed = bWeaponObstructed;
}

/*
CanAttack
*/
function bool CanAttack(Actor Other)
{
	// If our weapon is obstruced, we can't attack
	if (bWeaponObstructed != 0)
		return false;
		
	if (Weapon == None)
		return false;
		
	return Weapon.CanAttack(Other);
}

/*
TooCloseToAttack
	KRIS - Added check to see if muzzle is within collision radius of enemy and therefore won't hit them
*/
function bool TooCloseToAttack(Actor Other)
{
	local vector wLoc;
	
	if (LastWCWith == Other)
		return true;
		
	if ((CurrentWeaponAttachment != None) && (Pawn(Other) != None))
	{
		CurrentWeaponAttachment.Mesh.GetSocketWorldLocationAndRotation(CurrentWeaponAttachment.MuzzleFlashSocket, wLoc);
		if (VSize(wLoc - Other.Location) < (Pawn(Other).GetCollisionRadius() + 8))
			return true;
	}
	
	return false;
}

/*
SetHandIK
	Set left or right hand IK, depending on what animations are playing or if we're swimming etc.
*/
simulated function SetHandIK()
{
	if (TorsoSlotsPlaying || RightArmSlotsPlaying)
		RightHandIK.SetSkelControlStrength(0.0f, 0.0f);
	else
		RightHandIK.SetSkelControlStrength(1.0f, 0.0f);

	if (TorsoSlotsPlaying || RightArmSlotsPlaying || LeftArmSlotsPlaying || IsLongFall() || (Physics == PHYS_Swimming))
		LeftHandIK.SetSkelControlStrength(0.0f, 0.0f);
	else
		LeftHandIK.SetSkelControlStrength(1.0f, 0.0f);
}

/*
StopPlaySlotAnims
	Stop animations on torso, left or right arm.
*/
simulated function StopPlaySlotAnims(array<tfpAnimNodeSlotMirror> AnimSlots)
{
	local int i;
	
	if (AnimSlots[0].NodeName == 'LeftArmSlot')
		LeftArmSlotsPlaying = false;
	else if (AnimSlots[0].NodeName == 'RightArmSlot')
		RightArmSlotsPlaying = false;
	else if (AnimSlots[0].NodeName == 'TorsoSlot')
		TorsoSlotsPlaying = false;

	SetHandIK();
	
	// go through all the slot nodes
	for (i = 0; i < AnimSlots.length; i++)
			AnimSlots[i].StopCustomAnim(0.0);
}

/*
PlaySlotAnims
	Play animations on torso, left or right arm.
*/
simulated function PlaySlotAnims(array<tfpAnimNodeSlotMirror> AnimSlots, name AnimName, float	RateOrDuration, optional bool bDuration = false, optional bool bMirror, optional	float	BlendInTime, optional	float	BlendOutTime,	optional	bool	bLooping, optional bool	bOverride, optional float StartTime, optional float EndTime)
{
	local int i;

	if (AnimSlots.length < 1)
		return; // bah?

	if (AnimSlots[0].NodeName == 'LeftArmSlot')
		LeftArmSlotsPlaying = true;
	else if (AnimSlots[0].NodeName == 'RightArmSlot')
		RightArmSlotsPlaying = true;
	else if (AnimSlots[0].NodeName == 'TorsoSlot')
		TorsoSlotsPlaying = true;

	SetHandIK();

	// go through all the slot nodes
	for (i = 0; i < AnimSlots.length; i++)
	{
		if (bDuration)
			AnimSlots[i].PlayCustomMirrorAnimByDuration(AnimName,RateOrDuration,bMirror,BlendInTime,BlendOutTime,bLooping,bOverride);
		else
			AnimSlots[i].PlayCustomMirrorAnim(AnimName,RateOrDuration,bMirror,BlendInTime,BlendOutTime,bLooping,bOverride,StartTime,EndTime);
	}
}


/*
TossInventory
*/
function TossInventory(Inventory Inv, optional vector ForceVelocity)
{
	local vector	POVLoc, TossVel, TossLoc;
	local rotator	POVRot, TossRot;
	local Vector	X,Y,Z;

	if (ForceVelocity != vect(0,0,0))
		TossVel = ForceVelocity;
	else
	{
		GetActorEyesViewPoint(POVLoc, POVRot);
		TossVel = Vector(POVRot);
		TossVel = TossVel * ((Velocity Dot TossVel) + 500) + Vect(0,0,200);
	}

	GetAxes(Rotation, X, Y, Z);
	TossLoc = Location + 0.8 * CylinderComponent.CollisionRadius * X - 0.5 * CylinderComponent.CollisionRadius * Y;

	if (CurrentWeaponAttachmentClass.default.WeaponClass == Inv.Class)
		Mesh.GetSocketWorldLocationAndRotation(WeaponSocket, TossLoc, TossRot);
	else if (RightShoulderWeaponAttachmentClass.default.WeaponClass == Inv.Class)
		Mesh.GetSocketWorldLocationAndRotation(RightShoulderSocket, TossLoc, TossRot);
	else if (LeftShoulderWeaponAttachmentClass.default.WeaponClass == Inv.Class)
		Mesh.GetSocketWorldLocationAndRotation(LeftShoulderSocket, TossLoc, TossRot);
	
	Inv.SetRotation(TossRot);
	Inv.DropFrom(TossLoc, TossVel);
}

/*
ThrowActiveWeapon
	KRIS - Updated for TFP support.
*/
function ThrowActiveWeapon( optional bool bDestroyWeap )
{
	if (Weapon != None)
	{
		// If we're a bot, remember the weapon so we don't immediately try and pick it up.
		// This is actually left over from the (since removed) reloading support.
		if (tfpBot(Controller) != None)
			tfpBot(Controller).RememberWeDroppedThis(Weapon);

		// Clear the animation set
		ClearPlayerAnimSets();
	
		// Actually throw the weapon
		TossInventory(Weapon);
	}
}

/*
Landed
	KRIS - Updated for TFP support.
*/
event Landed(vector HitNormal, actor FloorActor)
{
	Super.Landed(HitNormal, FloorActor);

	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "bUpAndOut:" @ bUpAndOut @ "bLongFall:" @ bLongFall @ "Physics:" @ Physics);

	// Clear bUpAndOut, used for jumping out of the water.
	bUpAndOut = false;
	ClearTimer('WaterJumpEnd');
	bMantling = false;
	ClearTimer('FinishMantling');

	// Clear bLongFall.
	bLongFall = false;
	
	SetHandIK();
}

/*
StartDriving
	KRIS - Now changes head & shouldered weapon visibility
	Network: ALL
*/
simulated event StartDriving(Vehicle V)
{
	HeadMesh.SetOwnerNoSee(false);
	if (LeftShoulderWeaponAttachment != None)
		LeftShoulderWeaponAttachment.ChangeVisibility(false);
	if (RightShoulderWeaponAttachment != None)
		RightShoulderWeaponAttachment.ChangeVisibility(false);
	Super.StartDriving(V);
}

/*
StopDriving
	KRIS - Now changes head & shouldered weapon visibility
	Network: ALL
*/
simulated event StopDriving(Vehicle V)
{
	HeadMesh.SetOwnerNoSee(IsFirstPerson());
	if (LeftShoulderWeaponAttachment != None)
		LeftShoulderWeaponAttachment.ChangeVisibility(true);
	if (RightShoulderWeaponAttachment != None)
		RightShoulderWeaponAttachment.ChangeVisibility(true);
	Super.StopDriving(V);
}

/*
FootPlacement
	Adjusts the mesh translation offset on stairs/ledges
*/
simulated function FootPlacement(float DeltaTime)
{
	local float fRatio, FloorChangeZ;
	local vector FloorTrans;

	// get the difference in floor height
	FloorChangeZ = Location.Z - OldZ;

	// if we're on the ground and the floor change is reasonable, set the floor smoothing time
	if ((Physics == PHYS_Walking || Physics == PHYS_Spider) && (abs(FloorChangeZ) > 4.0f))
	{
		fFloorChangeTime = WorldInfo.TimeSeconds + FloorChangeDelayTime;
		fSmoothFloorChange = FloorChangeZ;
	}

	if (fFloorChangeTime != 0)
	{
		// Always add the base translation offset of this mesh
		FloorTrans = (vect(0,0,1) * BaseTranslationOffset);

		// If we want to smooth it still, figure out the ratio based on the time left
		if (fFloorChangeTime >= WorldInfo.TimeSeconds)
		{
			fRatio = (fFloorChangeTime - WorldInfo.TimeSeconds) / FloorChangeDelayTime;
			FloorTrans.Z -= (fRatio * fSmoothFloorChange);
		}
		else
			fFloorChangeTime = 0.0f;

		Mesh.SetTranslation(FloorTrans);
	}
	
	// remember the Z of the current location so we can compare it next tick
	OldZ = Location.Z;
}

/*
TakeDamage
	Updated to always send a projectiles velocity or the original momentum through to PlayHit().
*/
event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int ActualDamage;
	local PlayerController PC;
	local Controller Killer;
	local int OldHealth;
	local vector Original_Momentum;
	
	if ((Role < ROLE_Authority) || (Health <= 0))
	{
		return;
	}

	// Attached Bio glob instigator always gets kill credit
	if (AttachedProj != None && !AttachedProj.bDeleteMe && AttachedProj.InstigatorController != None)
	{
		InstigatedBy = AttachedProj.InstigatorController;
	}

	Original_Momentum = Momentum;
	
	// reduce rocket jumping
	if (InstigatedBy == Controller)
	{
		momentum *= 0.6;
	}

	// accumulate damage taken in a single tick
	if ( AccumulationTime != WorldInfo.TimeSeconds )
	{
		AccumulateDamage = 0;
		AccumulationTime = WorldInfo.TimeSeconds;
	}
    OldHealth = Health;
	AccumulateDamage += Damage;

	if (Damagetype == None)
	{
		if (InstigatedBy == None)
			`warn("No damagetype for damage with no instigator");
		else
			`warn("No damagetype for damage by "$InstigatedBy.Pawn$" with weapon "$InstigatedBy.Pawn.Weapon);
		//scripttrace();
		DamageType = class'DamageType';
	}
	Damage = Max(Damage, 0);

	if (Physics == PHYS_None && DrivenVehicle == None)
		SetMovementPhysics();
		
	if (Physics == PHYS_Walking && damageType.default.bExtraMomentumZ)
		Momentum.Z = FMax(Momentum.Z, 0.4 * VSize(Momentum));

	Momentum = Momentum / Mass;

	if (DrivenVehicle != None)
		DrivenVehicle.AdjustDriverDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType);

	ActualDamage = Damage;

	WorldInfo.Game.ReduceDamage(ActualDamage, self, instigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
	AdjustDamage(ActualDamage, Momentum, instigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);

	// call Actor's version to handle any SeqEvent_TakeDamage for scripting
	Super(Actor).TakeDamage(ActualDamage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

	Health -= ActualDamage;
	if (HitLocation == vect(0,0,0))
		HitLocation = Location;

	if (Health <= 0)
	{
		PC = PlayerController(Controller);
		// play force feedback for death
		if (PC != None)
			PC.ClientPlayForceFeedbackWaveform(damageType.default.KilledFFWaveform);

		// pawn died
		Killer = SetKillInstigator(InstigatedBy, DamageType);
		TearOffMomentum = Momentum;
		Died(Killer, damageType, HitLocation);
	}
	else
	{
		HandleMomentum(Momentum, HitLocation, DamageType, HitInfo);
		NotifyTakeHit(InstigatedBy, HitLocation, ActualDamage, DamageType, Momentum, DamageCauser);
		if (DrivenVehicle != None)
			DrivenVehicle.NotifyDriverTakeHit(InstigatedBy, HitLocation, actualDamage, DamageType, Momentum);
		if ((instigatedBy != None) && (instigatedBy != controller))
			LastHitBy = instigatedBy;
	}

	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "Momentum: " @ Momentum @ "DamageCauser: " @ DamageCauser @ "DamageCauser.Velocity:" @ DamageCauser.Velocity);
	
	if ((DamageCauser != None) && DamageCauser.IsA('Projectile'))
		PlayHit(actualDamage,InstigatedBy, hitLocation, damageType, DamageCauser.Velocity, HitInfo);
	else
		PlayHit(actualDamage,InstigatedBy, hitLocation, damageType, Original_Momentum, HitInfo);
		
	MakeNoise(1.0);
	
	AccumulateDamage = AccumulateDamage + OldHealth - Health - Damage;
}

/*
LeaveABloodSplatterDecal
	Now longer removes Z component of HitNorm
	FIXME - why is it called HitNorm when its actually the direction of the damage?
*/
simulated function LeaveABloodSplatterDecal( vector HitLoc, vector HitNorm )
{
	local Actor TraceActor;
	local vector out_HitLocation;
	local vector out_HitNormal;
	local vector TraceDest;
	local vector TraceStart;
	local vector TraceExtent;
	local TraceHitInfo HitInfo;
	local MaterialInstanceTimeVarying MITV_Decal;

	TraceStart = HitLoc;
	//HitNorm.Z = 0;
	//TraceDest =  TraceStart  + (HitNorm * 105);
	TraceDest =  TraceStart  + (Normal(HitNorm) * 256);
	
	TraceActor = Trace( out_HitLocation, out_HitNormal, TraceDest, TraceStart, false, TraceExtent, HitInfo, TRACEFLAG_PhysicsVolumes );

	/*
	`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "TraceActor: " @ TraceActor);
	
	if (out_HitLocation == vect(0,0,0))
		DrawDebugLine(TraceDest, TraceStart, 255, 0, 0, true);
	else
		DrawDebugLine(out_HitLocation, TraceStart, 0, 255, 0, true);
	*/
	
	if (TraceActor != None && Pawn(TraceActor) == None)
	{
		// we might want to move this to the UTFamilyInfo
		MITV_Decal = new(Outer) class'MaterialInstanceTimeVarying';
		MITV_Decal.SetParent( GetFamilyInfo().default.BloodSplatterDecalMaterial );

		WorldInfo.MyDecalManager.SpawnDecal(MITV_Decal, out_HitLocation, rotator(-out_HitNormal), 100, 100, 50, false,, HitInfo.HitComponent, true, false, HitInfo.BoneName, HitInfo.Item, HitInfo.LevelIndex);

		MITV_Decal.SetScalarStartTime( class'UTGib'.default.DecalDissolveParamName, class'UTGib'.default.DecalWaitTimeBeforeDissolve );
	}
}

/*
PlayTakeHitEffects
	Updated to support TFP, always spawn blood & allow player to see own blood.
	FIXME - test/enable physics based hit animations?
*/
simulated function PlayTakeHitEffects()
{
	local class<UTDamageType> UTDamage;
	local vector BloodMomentum;
	local UTEmit_HitEffect HitEffect;
	local ParticleSystem BloodTemplate;
	
	UTDamage = class<UTDamageType>(LastTakeHitInfo.DamageType);
	if (UTDamage != None)
	{
		// Always leave a blood decal (for now).
		//if (UTDamage.default.bCausesBloodSplatterDecals && !IsZero(LastTakeHitInfo.Momentum) && !class'UTGame'.Static.UseLowGore(WorldInfo))
		//{
			LeaveABloodSplatterDecal(LastTakeHitInfo.HitLocation, LastTakeHitInfo.Momentum);
		//}

		// Always cause a blood effect (for now).
		//if ( UTDamage.default.bCausesBlood && !class'UTGame'.Static.UseLowGore(WorldInfo) )
		//{
			BloodTemplate = class'UTEmitter'.static.GetTemplateForDistance(GetFamilyInfo().default.BloodEffects, LastTakeHitInfo.HitLocation, WorldInfo);
			if (BloodTemplate != None)
			{
				BloodMomentum = Normal(-1.0 * LastTakeHitInfo.Momentum) + (0.5 * VRand());
				HitEffect = Spawn(GetFamilyInfo().default.BloodEmitterClass, self,, LastTakeHitInfo.HitLocation, rotator(BloodMomentum));
				// We want to see our own blood.
				HitEffect.ParticleSystemComponent.SetOwnerNoSee(false);
				HitEffect.SetTemplate(BloodTemplate, true);
				HitEffect.AttachTo(self, LastTakeHitInfo.HitBone);
			}
		//}

		if ( !Mesh.bNotUpdatingKinematicDueToDistance )
		{
			// physics based takehit animations
			if (UTDamage != None)
			{
				//@todo: apply impulse when in full ragdoll too (that also needs to happen on the server)
				if ( !class'Engine'.static.IsSplitScreen() && Health > 0 && DrivenVehicle == None && Physics != PHYS_RigidBody &&
					VSize(LastTakeHitInfo.Momentum) > UTDamage.default.PhysicsTakeHitMomentumThreshold )
				{
					if (Mesh.PhysicsAssetInstance != None)
					{
						// just add an impulse to the asset that's already there
						Mesh.AddImpulse(LastTakeHitInfo.Momentum, LastTakeHitInfo.HitLocation);
						// if we were already playing a take hit effect, restart it
						if (bBlendOutTakeHitPhysics)
						{
							Mesh.PhysicsWeight = 0.5;
						}
					}
					else if (Mesh.PhysicsAsset != None)
					{
						Mesh.PhysicsWeight = 0.5;
						if (Mesh.PhysicsAssetInstance != None)
						{
							Mesh.PhysicsAssetInstance.SetNamedBodiesFixed(true, TakeHitPhysicsFixedBones, Mesh, true);
						}
						Mesh.AddImpulse(LastTakeHitInfo.Momentum, LastTakeHitInfo.HitLocation);
						bBlendOutTakeHitPhysics = true;
					}
				}

				UTDamage.static.SpawnHitEffect(self, LastTakeHitInfo.Damage, LastTakeHitInfo.Momentum, LastTakeHitInfo.HitBone, LastTakeHitInfo.HitLocation);
			}
		}
	}
}

defaultproperties
{
	Begin Object Name=WPawnSkeletalMeshComponent
		bOwnerNoSee=False
		AnimTreeTemplate=AnimTree'CH_TFP_Male.Tree.AT_CH_TFP'
		SkeletalMesh=SkeletalMesh'CH_TFP_Male.Mesh.tfpMale_Body'
		PhysicsAsset=PhysicsAsset'CH_TFP_Male.Mesh.tfpMale_Physics'
		AnimSets(0)=AnimSet'CH_TFP_Male.Anims.Anim_Base'
		bUpdateSkelWhenNotRendered=true
		bIgnoreControllersWhenNotRendered=false
		bTickAnimNodesWhenNotRendered=true
		bUpdateKinematicBonesFromAnimation=true
	End Object
	Mesh=WPawnSkeletalMeshComponent
	Components.Add(WPawnSkeletalMeshComponent)

	Begin Object Class=SkeletalMeshComponent Name=WHeadPawnSkeletalMeshComponent
		bCacheAnimSequenceNodes=FALSE
		AlwaysLoadOnClient=true
		AlwaysLoadOnServer=true
		CastShadow=true
		BlockRigidBody=TRUE
		bUpdateSkelWhenNotRendered=true
		bIgnoreControllersWhenNotRendered=false
		bTickAnimNodesWhenNotRendered=true
		bUpdateKinematicBonesFromAnimation=true
		bCastDynamicShadow=true
		Translation=(Z=0.0)
		RBChannel=RBCC_Untitled3
		RBCollideWithChannels=(Untitled3=true)
		LightEnvironment=MyLightEnvironment
		bOverrideAttachmentOwnerVisibility=true
		bAcceptsDynamicDecals=FALSE
		bHasPhysicsAssetInstance=true
		TickGroup=TG_PreAsyncWork
		MinDistFactorForKinematicUpdate=0.2
		bChartDistanceFactor=true
		//bSkipAllUpdateWhenPhysicsAsleep=TRUE
		RBDominanceGroup=20
		Scale=1.0
		// Nice lighting for hair
		bUseOnePassLightingOnTranslucency=TRUE
		bPerBoneMotionBlur=true
		SkeletalMesh=SkeletalMesh'CH_TFP_Male.Mesh.tfpMale_Head'
		// Assign the parent animation component to the head skeletal mesh component. This ensures that
		// the pawn animates as if it was one skeletal mesh component.
		ParentAnimComponent=WPawnSkeletalMeshComponent
		// Assign the shadow parent component to the head skeletal mesh component. This is used to speed up
		// the rendering of the shadow for this pawn and to prevent shadow overlaps from occur.
		ShadowParent=WPawnSkeletalMeshComponent
		// can't see own head
		bOwnerNoSee=true
		// but make sure our owner can still see our shadow...
		bCastHiddenShadow=true
	End Object
	HeadMesh=WHeadPawnSkeletalMeshComponent
	Components.Add(WHeadPawnSkeletalMeshComponent)

	EyeSocket=Eyes
	InventoryManagerClass=class'tfpInventoryManager'
	TimeToChangeAim=0.15
	bScriptTickSpecial=true

	/*
	Description from UDKPawn for 'var() int	 MaxYawAim';
	"How far RootYaw differs from Rotation.Yaw before it is rotated to catch up."
	Handled natively it would seem.
	Stuff that for now - let me control this in any aim nodes we do damnit...
	*/
	MaxYawAim=0

	MaxLegsYawIdle=8192
	MaxYawLegsRun=16384
	MaxLegsYawChangePerSecond=65536
	
	bUpdateEyeheight=false

	// the FOV to use when aiming
	//DesiredAimFOV=60

	TimeToPickup=0.5f
	
	LeftShoulderSocket=LeftShoulder
	RightShoulderSocket=RightShoulder
	
	LongFallTime=0.75f
	SwimmingZOffset=0.0f
	WaterLevelOffsetZ=-20.0f
	MaxOutOfWaterStepHeight=40.0
	WaterJumpTime=0.7f
	
	//bEnableFootPlacement=false

	// Sprinting sound.
	Begin Object Class=AudioComponent Name=PlayerAirMovingPastEarsSound
		SoundCue=SoundCue'CH_TFP_Male.Sounds.Sprinting'
	End Object
	AirMovingPastEarsSound=PlayerAirMovingPastEarsSound
	Components.Add(PlayerAirMovingPastEarsSound);

	RagdollLifespan=120

	// sick of misc sound issues & lack of gibs
	// FIXME - update to support UTFamilyInfo properly?
	SoundGroupClass=class'UTPawnSoundGroup_Liandri'
	CurrCharClassInfo=class'UTFamilyInfo_Liandri'

	IK_WeaponSocket=IK_WeaponPoint
	
	CameraScaleMax=128.0
	CamOffset=(X=16.0f,Y=0.0f,Z=-10.0f)

	FloorChangeDelayTime=0.1f
}