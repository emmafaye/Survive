class tfpPlayerInput extends UTPlayerInput within tfpPlayerController
	config(Input)
	DLLBind(FaceUDK);

// BEGIN FACEAPI
var tfpFaceAPI FaceAPI;
var class<tfpFaceAPI> FaceAPIClass;
// END FACEAPI

/*
InitInputSystem
	Updated to support FaceAPI
*/
function InitInputSystem()
{
	Super.InitInputSystem();

	// BEGIN FACEAPI
	if (FaceAPI == None)
	{
		Assert(FaceAPIClass != None);
		FaceAPI = new(Self) FaceAPIClass;

		if (FaceAPI != none)
			`log(self$"::InitInputSystem() - FaceAPI created");
	}
	// END FACEAPI
}

/*
PlayerInput
	Updated to support FaceAPI
*/
event PlayerInput( float DeltaTime )
{
	local float FOVScale, TimeScale;

	// Save Raw values
	RawJoyUp		= aBaseY;
	RawJoyRight		= aStrafe;
	RawJoyLookRight	= aTurn;
	RawJoyLookUp	= aLookUp;

	// PlayerInput shouldn't take timedilation into account
	DeltaTime /= WorldInfo.TimeDilation;
	if (Outer.bDemoOwner && WorldInfo.NetMode == NM_Client)
	{
		DeltaTime /= WorldInfo.DemoPlayTimeDilation;
	}

	PreProcessInput( DeltaTime );

	// Scale to game speed
	TimeScale = 100.f*DeltaTime;
	aBaseY		*= TimeScale * MoveForwardSpeed;
	aStrafe		*= TimeScale * MoveStrafeSpeed;
	aUp			*= TimeScale * MoveStrafeSpeed;
	aTurn		*= TimeScale * LookRightScale;
	aLookUp		*= TimeScale * LookUpScale;

	PostProcessInput( DeltaTime );

	ProcessInputMatching(DeltaTime);

	// Check for Double click movement.
	CatchDoubleClickInput();

	// Take FOV into account (lower FOV == less sensitivity).

	if ( bEnableFOVScaling )
	{
		FOVScale = GetFOVAngle() * 0.01111; // 0.01111 = 1 / 90.0
	}
	else
	{
		FOVScale = 1.0;
	}

	AdjustMouseSensitivity(FOVScale);

	// BEGIN FACEAPI
	// get the head pose etc
	if (FaceAPI != None)
		FaceAPI.HandleFaceTracking(DeltaTime, FOVScale);
	// END FACEAPI

	// mouse smoothing
	if ( bEnableMouseSmoothing )
	{
		aMouseX = SmoothMouse(aMouseX, DeltaTime,bXAxis,0);
		aMouseY = SmoothMouse(aMouseY, DeltaTime,bYAxis,1);
	}

	aLookUp			*= FOVScale;
	aTurn			*= FOVScale;

	// Turning and strafing share the same axis.
	if( bStrafe > 0 )
		aStrafe		+= aBaseX + aMouseX;
	else
		aTurn		+= aBaseX + aMouseX;

	// Look up/down.
	aLookup += aMouseY;
	if (bInvertMouse)
	{
		aLookup *= -1.f;
	}

	if (bInvertTurn)
	{
		aTurn *= -1.f;
	}

	// Forward/ backward movement
	aForward		+= aBaseY;

	// Handle walking.
	HandleWalking();

	// check for turn locking
	if (bLockTurnUntilRelease)
	{
		if (RawJoyLookRight != 0)
		{
			aTurn = 0.f;
			if (AutoUnlockTurnTime > 0.f)
			{
				AutoUnlockTurnTime -= DeltaTime;
				if (AutoUnlockTurnTime < 0.f)
				{
					bLockTurnUntilRelease = FALSE;
				}
			}
		}
		else
		{
			bLockTurnUntilRelease = FALSE;
		}
	}

	// ignore move input
	// Do not clear RawJoy flags, as we still want to be able to read input.
	if( IsMoveInputIgnored() )
	{
		aForward	= 0.f;
		aStrafe		= 0.f;
		aUp			= 0.f;
	}

	// ignore look input
	// Do not clear RawJoy flags, as we still want to be able to read input.
	if( IsLookInputIgnored() )
	{
		aTurn		= 0.f;
		aLookup		= 0.f;
	}
}

// BEGIN FACEAPI
exec function FaceShutdown()
{
	if (FaceAPI != None)
		FaceAPI.Shutdown();
}

exec function FaceRefFrame()
{
	if (FaceAPI != None)
		FaceAPI.RefFrame();
}

exec function FacePerformance()
{
	if (FaceAPI != None)
		FaceAPI.Performance();
}

exec function FaceHeadMesh()
{
	if (FaceAPI != None)
		FaceAPI.HeadMesh();
}

exec function FaceLandmarks()
{
	if (FaceAPI != None)
		FaceAPI.Landmarks();
}

exec function FaceVersion()
{
	local string sVersion;
	if (FaceAPI != None)
	{
		sVersion = "API VERSION: XXXX.XXXX.XXXX";
		FaceAPI.Version(sVersion);
		`log(self$" FaceVersion(): "$sVersion);
		ClientMessage(self$" FaceVersion(): "$sVersion);
	}
}

exec function SetNeutralHeadPose()
{
	if (FaceAPI != None)
	{
		if (!FaceAPI.bFaceInit)
			FaceAPI.InitFaceAPI();
	}
}

function ShutDownFaceAPI()
{
	if (FaceAPI != None)
	{
		`log(">>> "$self$" <<< ShutDownFaceAPI() : calling "$FaceAPI$".ShutDown()");
		FaceAPI.bFaceInit = false;
		FaceAPI.ShutDown();
	}
	FaceAPI = None;
}
// END FACEAPI

defaultproperties
{
	// BEGIN FACEAPI
	FaceAPIClass=class'TFP.tfpFaceAPI'
	// END FACEAPI
}