/**
 * tfpPlayerController.uc
 */
 class tfpPlayerController extends UTPlayerController
	config(TFP);

//================================================================================================================================================
// BEGIN VARIABLES
//================================================================================================================================================

struct ErrorInfo
{
	var string Text;
	var float Life; // time to stay on screen, -1 = forever.
};

var array<ErrorInfo> OnScreenErrors;

// Better handling of fixed view & support for a tracked view.
var bool bFixedView, bFixedTracking;

// The controller is no longer bound to the location or view of the pawn.
var bool bDetachedView;
var Pawn PreDetachedPawn;

// Keep track of what we want to pickup.
var Actor CurrentPickup;

//================================================================================================================================================
// END VARIABLES
//================================================================================================================================================

/*
ServerMove
	KRIS - Slight update & clean up to support different swimming.
*/
unreliable server function ServerMove(float TimeStamp, vector InAccel, vector ClientLoc, byte MoveFlags, byte ClientRoll, int View)
{
	local float DeltaTime;
	local rotator DeltaRot, Rot, ViewRot;
	local vector Accel;
	local int maxPitch, ViewPitch, ViewYaw;

	// If this move is outdated, discard it.
	if (CurrentTimeStamp >= TimeStamp)
	{
		return;
	}

	if (AcknowledgedPawn != Pawn)
	{
		InAccel = vect(0,0,0);
		GivePawn(Pawn);
	}

	// View components
	ViewPitch	= (View & 65535);
	ViewYaw		= (View >> 16);

	// Acceleration was scaled by 10x for replication, to keep more precision since vectors are rounded for replication
	Accel = InAccel * 0.1;
	// Save move parameters.
	DeltaTime = GetServerMoveDeltaTime(TimeStamp);

	CurrentTimeStamp = TimeStamp;
	ServerTimeStamp = WorldInfo.TimeSeconds;
	ViewRot.Pitch = ViewPitch;
	ViewRot.Yaw = ViewYaw;
	ViewRot.Roll = 0;

	if (InAccel != vect(0,0,0))
		LastActiveTime = WorldInfo.TimeSeconds;

	SetRotation(ViewRot);

	if (AcknowledgedPawn != Pawn)
		return;

	if (Pawn != None)
	{
		Rot.Roll	= 256 * ClientRoll;
		Rot.Yaw		= ViewYaw;

		// Unless we're flying, 0 out the pitch.
		if (Pawn.Physics == PHYS_Flying)
		{
			maxPitch = 2;
			if ((ViewPitch > maxPitch * Pawn.MaxPitchLimit) && (ViewPitch < 65536 - maxPitch * Pawn.MaxPitchLimit))
			{
				if (ViewPitch < 32768)
					Rot.Pitch = maxPitch * Pawn.MaxPitchLimit;
				else
					Rot.Pitch = 65536 - maxPitch * Pawn.MaxPitchLimit;
			}
		}
			
		DeltaRot = (Rotation - Rot);
		Pawn.FaceRotation(Rot, DeltaTime);
	}

	// Perform actual movement
	if ((WorldInfo.Pauser == None) && (DeltaTime > 0))
		MoveAutonomous(DeltaTime, MoveFlags, Accel, DeltaRot);

	ServerMoveHandleClientError(TimeStamp, Accel, ClientLoc);
	//`log("Server moved stamp "$TimeStamp$" location "$Pawn.Location$" Acceleration "$Pawn.Acceleration$" Velocity "$Pawn.Velocity);
}


/*
BehindView
	Slight update to support more camera modes.
*/
exec function BehindView()
{
	if (WorldInfo.NetMode == NM_Standalone)
	{
		// will get set back to true below, if necessary
		bDebugFreeCam = False;
		SetBehindView(!bBehindView);
	}
}

/*
PrevWeapon
	Slight update to support free cam mode.
*/
exec function PrevWeapon()
{
	if ((Vehicle(Pawn) != None) || (Pawn == None) || bDebugFreeCam)
		AdjustCameraScale(true);
	else if (!Pawn.IsInState('FeigningDeath'))
		Super.PrevWeapon();
}

/*
NextWeapon
	Slight update to support free cam mode.
*/
exec function NextWeapon()
{
	if ((Vehicle(Pawn) != None) || (Pawn == None) || bDebugFreeCam)
		AdjustCameraScale(false);
	else if (!Pawn.IsInState('FeigningDeath'))
		Super.NextWeapon();
}

/*
SetCameraMode
	Cleaned up & more camera modes.
*/
function SetCameraMode(name NewCamMode)
{
	local tfpPawn P;
	local bool bWasFixedView, bWasFixedTracking, bWasBehindView;
	
	bWasFixedView = bFixedView;
	bWasFixedTracking = bFixedTracking;
	bWasBehindView = bBehindView;
	
	P = tfpPawn(Pawn);
	
	if (P == None)
	{
		Super.SetCameraMode(NewCamMode);
		return;
	}

	bDetachedView = ((NewCamMode == 'Detached') || (NewCamMode == 'Detach'));
	if (bDetachedView)
		GotoState('PlayerDetached');

	bFixedTracking = ((NewCamMode == 'FixedTracking') && !bDetachedView);
	bFixedView = (((NewCamMode == 'Fixed') || bFixedTracking) && !bDetachedView);
	if ((bWasFixedView != bFixedView) || (bWasFixedTracking != bFixedTracking))
		P.SetFixedView(bFixedView, bFixedTracking);

	bDebugFreeCam = (((NewCamMode == 'FreeCam') || (NewCamMode == 'Free')) && !bDetachedView);
	if (bDebugFreeCam)
		DebugFreeCamRot = Rotation;

	bBehindView = (((NewCamMode == 'ThirdPerson') || (NewCamMode == 'Third') || bDebugFreeCam) && !bDetachedView);
	if (bWasBehindView != bBehindView)
		SetBehindView(bBehindView);

	P.SetHeadVisibility();

	if (PlayerCamera != None)
		Super(UDKPlayerController).SetCameraMode(NewCamMode);
	
	ClientMessage("Camera '"$NewCamMode$"'");
	`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "NewCamMode:" @ NewCamMode);
}

/*
ValidPickup
	Since PickupFactories, DroppedPickups etc don't share and common parent class, 
	we need this function to check what they are and if they can currently be picked up.
*/
function bool ValidPickup(Actor Pickup)
{
    if (DroppedPickup(Pickup) != None)
		return (!DroppedPickup(Pickup).bFadeOut);
	else if (UTWeaponLocker(Pickup) != None)
		return false;
    else if (PickupFactory(Pickup) != None)
        return (PickupFactory(Pickup).bPickupHidden == false);
    else if (UTCarriedObject(Pickup) != None)
		return ((UTCarriedObject(Pickup).bHome == true) || (UTCarriedObject(Pickup).IsInState('Dropped')));

    // not a valid pickup
    return false;
}

/*
FindPickup
	Finds a pickup (dropped, factory etc) within a limited radius.
	Returns true if its valid.
*/
function bool FindPickup()
{
	local Actor Pickup, Best;
	local vector ViewDir, PawnLoc2D, PickupLoc2D;
	local float NewDot, BestDot;

    if (Pawn == None)
        return false;

    CurrentPickup = None;

    // Are we standing on one?
    if ((Pawn.Base != None) && ValidPickup(Pawn.Base))
	{
        CurrentPickup = Pawn.Base;
		return true;
	}

	// Pick best nearby item.
	PawnLoc2D = Pawn.Location;
	PawnLoc2D.Z = 0;
	ViewDir = vector(Pawn.Rotation);

	ForEach Pawn.OverlappingActors(class'Actor', Pickup, Pawn.VehicleCheckRadius)
	{
        if (ValidPickup(Pickup))
        {
            // Prefer items that Pawn is facing
			PickupLoc2D = Pickup.Location;
            PickupLoc2D.Z = 0;
            NewDot = Normal(PickupLoc2D-PawnLoc2D) Dot ViewDir;
            if ((Best == None) || (NewDot > BestDot))
            {
                // check that item is visible
                if (FastTrace(Pickup.Location, Pawn.Location))
                {
                    Best = Pickup;
                    BestDot = NewDot;
                }
            }
		}
	}

    // Remember what we found.
    CurrentPickup = Best;

    // If Best is not NULL, we found something.
	return (Best != None);
}

/*
PerformedUseAction
	Add pickup check and touch routine.
	Allows us to pickup item when we hit USE.
*/
simulated function bool PerformedUseAction()
{
	local UTCarriedObject Flag;
	local Actor Original_MoveTarget;

	// If the level is paused...
	if (WorldInfo.Pauser == PlayerReplicationInfo)
	{
		// ... unpause and move on.
		if (Role == Role_Authority)
			SetPause(false);
		return true;
	}

	// No pawn, can't use or feigning death? No can usey stuff.
	if ((Pawn == None) || Pawn.IsInState('FeigningDeath'))
		return true;

	// Have a weapon that is firing or can't be swapped? No can usey stuff.
	if ((Pawn.Weapon != None) && (Pawn.Weapon.IsFiring() || Pawn.Weapon.DenyClientWeaponSet()))
		return true;

	// Already picking something up.
	if (Pawn.IsTimerActive('PickupFinished'))
		return true;

	bJustFoundVehicle = false;

	if (Vehicle(Pawn) == None)
	{
		ForEach Pawn.TouchingActors(class'UTCarriedObject', Flag)
		{
			if (Flag.FlagUse(self))
				return true;
		}
	}

	// Below is only on server.
	if (Role < Role_Authority)
		return false;

	// Leave vehicle if currently in one.
	if (Vehicle(Pawn) != None)
		return Vehicle(Pawn).DriverLeave(false);

	// If we find a valid pickup, touch it.
	if (FindPickup())
	{
		Original_MoveTarget = MoveTarget;
		MoveTarget = CurrentPickup;
		CurrentPickup.Touch(Pawn, None, CurrentPickup.Location, Normal(CurrentPickup.Location-Pawn.Location));
		MoveTarget = Original_MoveTarget;
		return true;
	}

	// Try to find a vehicle to drive.
	if (FindVehicleToDrive())
		return true;

	// Try to interact with triggers.
	return TriggerInteracted();
}


/*
AddOnScreenError
*/
simulated function AddOnScreenError(string ErrorText, optional float Life = 10.0f)
{
	local ErrorInfo NewError;
	local int i;

	NewError.Text = ErrorText;
	if (Life == -1)
		NewError.Life = -1;
	else
		NewError.Life = WorldInfo.TimeSeconds + Life;

	for (i = 0; i < OnScreenErrors.length; i++)
	{
		if (OnScreenErrors[i].Text == NewError.Text)
		{
			OnScreenErrors[i].Life = NewError.Life;
			return;
		}
	}
	
	OnScreenErrors.AddItem(NewError);
}

/*
DrawOnScreenErrors
*/
simulated function DrawOnScreenErrors(HUD H)
{
	local Canvas Canvas;
	local float BestXL, CurYL, XL, YL;
	local int i;

	if (OnScreenErrors.length <= 0)
		return;

	Canvas = H.Canvas;

	Canvas.Font = H.GetFontSizeIndex(2);
	for (i = 0; i < OnScreenErrors.length && i < 32; i++)
	{
		Canvas.TextSize(OnScreenErrors[i].Text, XL, YL);
		CurYL += YL;
		if (XL > BestXL)
			BestXL = XL;
	}

	// Draw a rectangle behind it all.
	Canvas.SetPos(Canvas.ClipX - (BestXL + 8), 4);
	Canvas.DrawRect((BestXL + 8), (CurYL + 8));

	CurYL = 8;
	for (i = 0; i < OnScreenErrors.length && i < 32; i++)
	{
		Canvas.TextSize(OnScreenErrors[i].Text, XL, YL);
		Canvas.SetPos(Canvas.ClipX - (XL + 4), CurYL);
		CurYL += YL;
		Canvas.SetDrawColor(255, 255, 0, 255);
		Canvas.DrawText(OnScreenErrors[i].Text, FALSE);
	}

	for (i = 0; i < OnScreenErrors.length; i++)
	{
		if ((OnScreenErrors[i].Life != -1) && (OnScreenErrors[i].Life < WorldInfo.TimeSeconds))
			OnScreenErrors.RemoveItem(OnScreenErrors[i]);
	}
}

/*
AddSomeError
*/
exec function AddSomeError()
{
	AddOnScreenError("ERROR: Time is " $ WorldInfo.TimeSeconds);
}

/*
DrawHUD
	Added "USE" button display if a pickup is found nearby
	Added DrawOnScreenErrors.
*/
function DrawHUD( HUD H )
{
	local string FoundPickupText, KeyStr;
	local vector2d txtPos, fScale;
	local color txtColor;
	local class<Inventory> PickupItemClass;
	local string ItemName;

	DrawOnScreenErrors(H);
		
	Super.DrawHud(H);

	// If we find a pickup, display the "USE" button
	if (Pawn != None && IsLocalPlayerController())
	{
		// Have a weapon that is firing or can't be swapped? No can usey stuff.
		if ((Pawn.Weapon != None) && (Pawn.Weapon.IsFiring() || Pawn.Weapon.DenyClientWeaponSet()))
			return;
			
		// Already picking something up.
		if (Pawn.IsTimerActive('PickupFinished'))
			return;

		if (FindPickup())
		{
			//Get the fully localized version of the key binding
			BoundEventsStringDataStore.GetStringWithFieldName("GBA_Use", KeyStr);
			if (KeyStr == "")
				KeyStr = "<unbound>";

			if (CurrentPickup.IsA('UTDroppedPickup'))
				PickupItemClass = UTDroppedPickup(CurrentPickup).InventoryClass;
			else if (CurrentPickup.IsA('UTItemPickupFactory'))
				ItemName = UTItemPickupFactory(CurrentPickup).Default.PickupMessage;
			else if (CurrentPickup.IsA('PickupFactory'))
				PickupItemClass = PickupFactory(CurrentPickup).InventoryType;
			
			if (PickupItemClass != None)
				ItemName = PickupItemClass.Default.PickupMessage;
			
			if ((Pawn.Weapon != None) && (class<Weapon>(PickupItemClass) != None) && (Pawn.FindInventoryType(PickupItemClass) == None)
			 && (tfpInventoryManager(Pawn.InvManager) != None) && (tfpInventoryManager(Pawn.InvManager).WeaponCount() >= tfpInventoryManager(Pawn.InvManager).MaxWeaponCount)) 
				FoundPickupText = "Press '"$KeyStr$"' to swap "$Pawn.Weapon.ItemName$" for "$ItemName;
			else
				FoundPickupText = "Press '"$KeyStr$"' to pickup "$ItemName;
				
			txtPos.Y = H.Canvas.ClipY / 2;
			fScale.X = 1.0f;
			fScale.Y = 1.0f;
			txtColor.R = 255;
			txtColor.G = 255;
			txtColor.B = 0;
			txtColor.A = 255;
			H.DrawText(FoundPickupText, txtPos, H.GetFontSizeIndex(2), fScale, txtColor);
		}
	}
}


/*
Dead
	Removed forced third person on death.
*/
state Dead
{
	function BeginState(Name PreviousStateName)
	{
		local UTWeaponPickupFactory WF;

		LastAutoObjective = None;

		Super(UDKPlayerController).BeginState(PreviousStateName);

		if ( LocalPlayer(Player) != None )
		{
			ForEach WorldInfo.AllNavigationPoints(class'UTWeaponPickupFactory',WF)
				WF.NotifyLocalPlayerDead(self);
		}

		if ((Role == ROLE_Authority) && (UTGame(WorldInfo.Game) != None) && UTGame(WorldInfo.Game).ForceRespawn())
			SetTimer(MinRespawnDelay, true, 'DoForcedRespawn');
	}
	
	function EndState(name NextStateName)
	{
		Super.EndState(NextStateName);

		bDetachedView = false;
		bFixedView = false;
		bFixedTracking = false;
	}

	exec function StopFire(optional byte FireModeNum){}
}

/*
RoundEnded
*/
state RoundEnded
{
	exec function StopFire(optional byte FireModeNum){}
}

/*
PlayerSwimming
	KRIS - updated to fix swimming issues and support TFP better.
*/
state PlayerSwimming
{
ignores SeePlayer, HearNoise, Bump;
	/*
	NotifyPhysicsVolumeChange
		Since we no longer leave the water volume unless we're jumping out, 
		I moved jumping out of the water mechanics to the pawn.
		See tfpPawn::UpdateWaterLevel().
	*/
	event NotifyPhysicsVolumeChange( PhysicsVolume NewVolume )
	{
		if (!Pawn.bCollideActors)
			GotoState(Pawn.LandMovementState);

		if (Pawn.Physics != PHYS_RigidBody)
		{
			if (!Pawn.bUpAndOut)
				Pawn.SetPhysics(PHYS_Swimming);
		}
		else if (!NewVolume.bWaterVolume)
		{
			// if in rigid body, go to appropriate state, but don't modify pawn physics
			GotoState(Pawn.LandMovementState);
		}
	}

	/*
	ProcessMove
		The pawns pitch is no longer set when swimming, so make sure the remote pitch is set.
		FIXME - Figure out how to match the older style later?
	*/
	function ProcessMove(float DeltaTime, vector NewAccel, eDoubleClickDir DoubleClickMove, rotator DeltaRot)
	{
		if (Pawn == None)
			return;

		// Update ViewPitch for remote clients
		if (Role == ROLE_Authority)
			Pawn.SetRemoteViewPitch( Rotation.Pitch );

		Pawn.Acceleration = NewAccel;
	}

	/*
	PlayerMove
		Updated to new swimming.
	*/
	function PlayerMove(float DeltaTime)
	{
		local rotator oldRotation;
		local vector X,Y,Z, NewAccel;

		if (Pawn == None)
		{
			GotoState('Dead');
		}
		else
		{
			GetAxes(Rotation,X,Y,Z);

			NewAccel = PlayerInput.aForward * X + PlayerInput.aStrafe * Y + PlayerInput.aUp * vect(0,0,1);
			NewAccel = Pawn.AccelRate * Normal(NewAccel);
			
			if (tfpPawn(Pawn) != None)
			{
				// If we're at the water level and stil trying to move up,
				// don't let us, but remember that we wanted too.
				if (tfpPawn(Pawn).bAtWaterLevel && (NewAccel.Z > 0.0f))
				{
					NewAccel.Z = 0.0f;
					tfpPawn(Pawn).bJumpAtWaterLevel = true;
				}
				else
					tfpPawn(Pawn).bJumpAtWaterLevel = false;
			}	
			
			// Update rotation.
			oldRotation = Rotation;
			UpdateRotation(DeltaTime);

			if (Role < ROLE_Authority) // then save this move and replicate it
				ReplicateMove(DeltaTime, NewAccel, DCLICK_None, OldRotation - Rotation);
			else
				ProcessMove(DeltaTime, NewAccel, DCLICK_None, OldRotation - Rotation);
			bPressedJump = false;
		}
	}

	event BeginState(Name PreviousStateName)
	{
		if (Pawn.Physics != PHYS_RigidBody)
			Pawn.SetPhysics(PHYS_Swimming);
	}

Begin:
}

/*
PlayerDetached
	New 'camera' mode, for lack of a bette term.
	Lets you ghost around the level, quickly view other players/bots and return to you body if need be.
*/
state PlayerDetached extends BaseSpectating
{
	function SetCameraMode(name NewCamMode)
	{
		if ((NewCamMode == 'Detached') || (NewCamMode == 'Detach'))
			return;
			
		StopAltFire();
		Global.SetCameraMode(NewCamMode);
	}
	
	function ViewAPlayer(int dir)
	{
		local vector CurLoc;
		local Rotator CurRot;
		local PlayerReplicationInfo PRI;

		PRI = GetNextViewablePlayer(dir);

		if ( PRI != None )
		{
			SetViewTarget(PRI);
			
			if ((Controller(PRI.Owner) != None) && (Controller(PRI.Owner).Pawn != None))
			{
				Controller(PRI.Owner).Pawn.GetActorEyesViewPoint(CurLoc, CurRot);
				SetLocation(CurLoc);
				CurRot.Roll = 0;
				SetRotation(CurRot);
			}
		}
	}

	simulated event GetPlayerViewPoint( out vector out_Location, out Rotator out_Rotation )
	{
		out_Location = Location;
		out_Rotation = Rotation;
	}

	exec function StartFire( optional byte FireModeNum )
	{
		ServerViewObjective();
	}
	
	exec function StartAltFire( optional byte FireModeNum )
	{
	}
	
	exec function StopAltFire( optional byte FireModeNum )
	{
		ServerViewSelf();
		if (PreDetachedPawn != None)
		{
			if (PreDetachedPawn.bTearOff || (PreDetachedPawn.Health <= 0))
			{
				if (!WorldInfo.Game.PlayerCanRestart( Self ) )
					return;
		
				WorldInfo.Game.RestartPlayer(Self);
			}
			else
				Possess(PreDetachedPawn, false);
		}
	}
	
	exec function PrevWeapon()
	{
		ServerViewPrevPlayer();
	}

	exec function NextWeapon()
	{
		ServerViewNextPlayer();
	}
	
	function BeginState(Name PreviousStateName)
	{
		local vector CurLoc;
		local Rotator CurRot;

		bDetachedView = true;
		bCollideWorld = false;
		
		Global.GetPlayerViewPoint(CurLoc, CurRot);

		if (Pawn != None)
		{
			PreDetachedPawn = Pawn;
			Pawn.Acceleration = vect(0,0,0);

			// Update ViewPitch for remote clients
			if (Role == ROLE_Authority)
				Pawn.SetRemoteViewPitch(CurRot.Pitch);

			UnPossess();
		}
		
		SetLocation(CurLoc);
		CurRot.Roll = 0;
		SetRotation(CurRot);
	}
}

/*
DisplayDebug
	Updated to display FaceAPI info, if desired.
*/
simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	Super.DisplayDebug(HUD, out_YL, out_YPos);
	
	if ( HUD.ShouldDisplayDebug('faceapi') && (tfpPlayerInput(PlayerInput) != None) && (tfpPlayerInput(PlayerInput).FaceAPI != None))
		tfpPlayerInput(PlayerInput).FaceAPI.DisplayDebug(HUD, out_YL, out_YPos);
}

defaultproperties
{
	Name="Default__tfpPlayerController"
	MatineeCameraClass=class'Engine.Camera'
	CameraClass=None
	InputClass=class'TFP.tfpPlayerInput'
	CheatClass=class'tfpCheatManager'
}