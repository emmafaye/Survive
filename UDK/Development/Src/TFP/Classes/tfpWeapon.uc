class tfpWeapon extends UTWeapon;

//================================================================================================================================================
// BEGIN VARIABLES
//================================================================================================================================================

// Animation sets to use with this weapon.
var array<AnimSet> PlayerAnimSets;

// The translation to set when player is aiming with this weapon.
var() vector aimOffset;

// The translation & rotation to set when weapon is obstructed.
var() vector obLowTrans, obLowCrouchTrans, obHighTrans;
var() rotator obLowRot, obLowCrouchRot, obHighRot;

// The translation & rotation to set when player is spriting using this weapon.
var() vector SprintTrans;
var() rotator SprintRot;

// The FOV to use when aiming
var() float DesiredAimFOV;

//================================================================================================================================================
// END VARIABLES
//================================================================================================================================================

//================================================================================================================================================
// START DISABLED FUNCTIONS
//================================================================================================================================================

simulated function DrawWeaponCrosshair(Hud HUD);
simulated function CreateOverlayMesh();
simulated function SetSkin(Material NewMaterial);
simulated function PlayArmAnimation(Name Sequence, float fDesiredDuration, optional bool OffHand, optional bool bLoop, optional SkeletalMeshComponent SkelMesh);
simulated function PlayWeaponAnimation(name Sequence, float fDesiredDuration, optional bool bLoop, optional SkeletalMeshComponent SkelMesh);
simulated event SetPosition(UDKPawn Holder);
simulated function PreloadTextures(bool bForcePreload);
simulated function SetupArmsAnim();
simulated function SetWeaponOverlayFlags(UTPawn OwnerPawn);

//================================================================================================================================================
// END DISABLED FUNCTIONS
//================================================================================================================================================

/*
Active
	Removed first person references.
*/
simulated state Active
{
	simulated function ChangeVisibility(bool bIsVisible)
	{
		Global.ChangeVisibility(bIsVisible);
	}
}

/*
WeaponPuttingDown
	Removed first person references.
*/
simulated state WeaponPuttingDown
{
	simulated function EndState(Name NextStateName)
	{
		Super(UDKWeapon).EndState(NextStateName);
	}
}

/*
WeaponAbortEquip
	Removed first person references.
*/
simulated state WeaponAbortEquip
{
	simulated function BeginState(name PrevStateName)
	{
		SetTimer(FMax(SwitchAbortTime, 0.01),, 'WeaponEquipAborted');
	}
}

/*
WeaponEquipping
	Removed first person references.
*/
simulated state WeaponEquipping
{
	simulated function EndState(Name NextStateName)
	{
		ClearTimer('WeaponEquipped');
	}
}

/*
PlayFireEffects
	Removed first person references.
*/
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
	ShakeView();
}

/*
AttachWeaponTo
	Removed first person references.
*/
simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
	local UTPawn UTP;

	UTP = UTPawn(Instigator);

	// Spawn the 3rd Person Attachment
	if ((Role == ROLE_Authority) && (UTP != None))
	{
		UTP.CurrentWeaponAttachmentClass = AttachmentClass;
		UTP.WeaponAttachmentChanged();
	}
}

/*
DetachWeapon
	Removed first person references.
*/
simulated function DetachWeapon()
{
	local UTPawn P;

	P = UTPawn(Instigator);
	if (P != None)
	{
		if (Role == ROLE_Authority && P.CurrentWeaponAttachmentClass == AttachmentClass)
		{
			P.CurrentWeaponAttachmentClass = None;
			P.WeaponAttachmentChanged();
		}
	}

	SetBase(None);
	SetHidden(True);
}

/*
CanThrow
	Can always throw these.
*/
simulated function bool CanThrow()
{
	return true;
}

/*
GetPhysicalFireStartLoc
	Returns actual location of muzzle
	(InstantFireStartTrace() -> Instigator.GetWeaponStartTraceLocation() -> CurrentWeaponAttachment.GetEffectLocation())
*/
simulated function vector GetPhysicalFireStartLoc(optional vector AimDir)
{
	return InstantFireStartTrace();
}

/*
BestMode
*/
function byte BestMode()
{
	// There is only one mode (at the moment...).
	return 0;
}

/*
WeaponEmpty
	No longer auto-switches weapon if its empty.
*/
simulated function WeaponEmpty()
{
	// If we were firing, stop
	if (IsFiring())
		GotoState('Active');
}

/*
BotDesireability
	Now stops bot wanting a weapon they just dropped.
	KRIS - Need this when I was working on reloading.
		Though I removed it, I never bothered to take this out.
*/
static function float BotDesireability(Actor PickupHolder, Pawn P, Controller C)
{
	if ((tfpBot(C) != None) && (UTDroppedPickup(PickupHolder) != None))
	{
		// We just dropped it, so we don't want it.
		if (tfpBot(C).WeDroppedThisRecently(UTDroppedPickup(PickupHolder).Inventory))
			return 0;
	}

	return Super.BotDesireability(PickupHolder, P, C);
}

/*
DenyPickupQuery
	Added support for visible item pickups.
*/
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	local DroppedPickup DP;

	// By default, you can only carry a single item of a given class.
	if (ItemClass == class)
	{
		DP = DroppedPickup(Pickup);
		if (DP != None)
		{
			// If we don't need the ammo, don't take it.
			if (AmmoCount >= MaxAmmoCount)
				return true;
				
			// Take the ammo that the dropped weapon has.
			AddAmmo(UTWeapon(DP.Inventory).AmmoCount);
			DP.PickedUpBy(Instigator);
			AnnouncePickup(Instigator);
		}
		else
		{
			// If we don't need the ammo, don't take it.
			if (AmmoCount >= MaxAmmoCount)
				return true;
				
			// Add the ammo that the pickup should give us, then tell it to respawn.
			AddAmmo(default.AmmoCount);
			if ( PickupFactory(Pickup) != None )
				PickupFactory(Pickup).PickedUpBy(Instigator);
			AnnouncePickup(Instigator);
		}
		
		// Set the pickup class so we play the animation etc.
		if (tfpInventoryManager(InvManager) != None)
		{
			tfpInventoryManager(InvManager).LastPickupClass = Class;
			tfpInventoryManager(InvManager).SetCurrentPickup();
		}
		return true;
	}

	return false;
}

/*
DropFrom
	Now sets DroppedPickups rotation (see tfpPawn::TossInventory()).
*/
function DropFrom(vector StartLocation, vector StartVelocity)
{
	local DroppedPickup P;

	if (Instigator != None && Instigator.IsHumanControlled() && Instigator.IsLocallyControlled())
		PreloadTextures(false);

	if(!CanThrow())
		return;

	// Become inactive
	GotoState('Inactive');

	// Stop Firing
	ForceEndFire();
	
	// Detach weapon components from instigator
	DetachWeapon();

	if ((Instigator != None) && (Instigator.InvManager != None))
		Instigator.InvManager.RemoveFromInventory(Self);

	// if cannot spawn a pickup, then destroy and quit
	if ((DroppedPickupClass == None) || (DroppedPickupMesh == None))
	{
		Destroy();
		return;
	}

	P = Spawn(DroppedPickupClass,,, StartLocation);
	if (P == None)
	{
		Destroy();
		return;
	}

	P.SetPhysics(PHYS_Falling);
	P.Inventory	= self;
	P.InventoryClass = class;
	P.Velocity = StartVelocity;
	P.Instigator = Instigator;
	P.SetPickupMesh(DroppedPickupMesh);
	P.SetPickupParticles(DroppedPickupParticles);
	P.SetRotation(Rotation);

	Instigator = None;
	GotoState('');

	AIController = None;
}

defaultproperties
{
	Mesh=None
	FireOffset=(X=0,Y=0,Z=0)
	obLowRot=(Pitch=-10923,Roll=2731,Yaw=-2731)
	obLowCrouchRot=(Pitch=-10923,Roll=2731,Yaw=-2731)
	SprintTrans=(X=7,Y=5,Z=-5)
	SprintRot=(Pitch=5461,Roll=-2731,Yaw=-6372)
	DesiredAimFOV=90
}