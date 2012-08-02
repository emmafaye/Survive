/**
 * tfpFACEApi.uc
 *
 * Author: Kris Rigby
 * E-mail: kris@dude.com.au
 * Website: krisredbeard.wordpress.com
 *
 * Seeing Machines FaceAPI integration.
 * Website: http://www.seeingmachines.com/product/faceapi/
 */
class tfpFaceAPI extends Object within tfpPlayerInput
	config(Input)
	DLLBind(FaceUDK);
`include (TFP/Classes/tfpFaceAPIErrorCodes.uci)

//================================================================================================================================================
// BEGIN VARIABLES
//================================================================================================================================================

struct UDKHeadPoseData
{
    var vector head_pos;
    var vector left_eye_pos;
    var vector right_eye_pos;
    var vector head_rot;
    var float confidence;
};

var UDKHeadPoseData CurHPD;

var bool bFaceInit;

var float SnapShotStart;

var float aFaceYaw;
var float aFacePitch;
var float aFaceRoll;

var bool bGetHPDFailed;

/** lerp speed */
var() config float voIntSpeed;
/** Should lerp speed be continuous? */
var() config bool voContIntSpeed;

enum eHDIs
{
	hdi_Yaw,
	hdi_Pitch
};

struct ShapShotSample
{
	var int Value[eHDIs];
	var float Time;
};

var int aFace[eHDIs];
var Array<ShapShotSample> SnapShotSamples;

var int OldNeutralData[eHDIs];
var int NeutralData[eHDIs];
var int NeutralCount[eHDIs];

var int OldRecentData[eHDIs];
var() config int RecentErrorMargin[eHDIs];
var int RecentData[eHDIs];
var int RecentCount[eHDIs];

/** How big a neutral sample we should take */
var() config float RecentSampleTime;
var() config float MinSampleTime;
var() config float MaxSampleTime;

/** How big is the area we should consider as dead (totally ignored) */
var() config int DeadZone[eHDIs];

/** How big is the area we should consider as maximum (totally ignored) */
var() config int OuterZone[eHDIs];

var rotator ViewOffset;
var float fConfidence;

//================================================================================================================================================
// END VARIABLES
//================================================================================================================================================

//================================================================================================================================================
// BEGIN DLL IMPORT FUNCTIONS
//================================================================================================================================================

dllimport final function int InitAPI();
dllimport final function int CameraRegister();
dllimport final function int EngineCreate();
dllimport final function EngineStart();

dllimport final function Version(out string s);
dllimport final function RefFrame();
dllimport final function Performance();
dllimport final function HeadMesh();
dllimport final function Landmarks();
dllimport final function bool ShutDown();
dllimport final function int GetHeadPoseData(out UDKHeadPoseData HPD);

//================================================================================================================================================
// END DLL IMPORT FUNCTIONS
//================================================================================================================================================
	
//================================================================================================================================================
// BEGIN ERROR HANDLING
//================================================================================================================================================
function string GetSM_API_ErrorCode(int code)
{
	switch(code)
	{
		case `SM_API_OK:
			return "API function call was successful.";
		// Errors
		case `SM_API_FAIL_INVALID_CALL:
			return "Function is not valid or unsupported.";
		case `SM_API_FAIL_INVALID_ARGUMENT:
			return "A bad parameter was passed.";
		case `SM_API_FAIL_CPU_INADEQUATE:
			return "CPU features are inadequate for the function.";
		case `SM_API_FAIL_MEMORY_INADEQUATE:
			return "Not enough memory for the function.";
		case `SM_API_FAIL_OUT_OF_MEMORY:
			return "Ran out of memory while calling the function.";
		case `SM_API_FAIL_OPEN_FILE:
			return "A file could not be found or opened.";
		case `SM_API_FAIL_PARSE_FILE:
			return "A file format was not recognized.";
		case `SM_API_FAIL_WRITE_FILE:
			return "A file or folder could not be created or written. ";
		case `SM_API_FAIL_CAMERA_ERROR:
			return "Could not find / initialize a camera.";
		case `SM_API_FAIL_NO_LICENSE:
			return "The license is invalid.";
		case `SM_API_FAIL_INVALID_ENGINE_STATE:
			return "The engine state is invalid for the function call. ";
		case `SM_API_FAIL_STD_ERROR:
			return "Error using the C++ std library";
		case `SM_API_FAIL_UNSPECIFIED:
			return "An unknown error occured. Check the application log.";
		case `SM_API_FAIL_PROGRAMMING_ERROR:
			return "An internal check detected an invalid logic condition.";
		case `SM_API_FAIL_CORE_EXCEPTION:
			return "A core-library exception occured.";
		case `SM_API_FAIL_CAMERA_NOT_STARTED:
			return "The camera is not started.";
		case `SM_API_FAIL_CAMERA_IMAGE_PUSH:
			return "Failed to push image into camera.";
		case `SM_API_FAIL_UNITIALIZED:
			return "The API is not initialized.";
		case `SM_API_FAIL_BUFFER_TOO_SMALL:
			return "Supplied data buffer is too small.";
		case `SM_API_FAIL_CAMERA_HAS_STARTED:
			return "The camera has already been started.";
	}
	
	return "Don't fucking know";
}

function bool ReturnOnError(int code, optional bool LogError = true)
{
	if (code != `SM_API_OK)
	{
		if (LogError)
		{
			`log("ERROR: "$GetSM_API_ErrorCode(code));
			ClientMessage("ERROR: "$GetSM_API_ErrorCode(code));
		}
		return true;
	}

	return false;
}

//================================================================================================================================================
// END ERROR HANDLING
//================================================================================================================================================

function InitFaceAPI()
{
	if (bFaceInit)
	{
		`log(self$" InitFaceAPI(): already init'd");
		ClientMessage(self$" InitFaceAPI(): already init'd");
		return;
	}

	`log(self$" InitFaceAPI():");
	ClientMessage(self$" InitFaceAPI():");

	// Initialize the Face Tracking API
	`log("Initialize the Face Tracking API");
	ClientMessage("Initialize the Face Tracking API");

	if (ReturnOnError(InitAPI()))
		return;

	// Register the WDM category of cameras
	`log("Register the WDM category of cameras");
	ClientMessage("Register the WDM category of cameras");

	if (ReturnOnError(CameraRegister()))
		return;

	// Create a new Head-Tracker engine that uses the camera
	`log("Create a new Head-Tracker engine that uses the camera");
	ClientMessage("Create a new Head-Tracker engine that uses the camera");

	if (ReturnOnError(EngineCreate()))
		return;
	
	// all done, start tracking
	EngineStart();
	`log("FaceAPI initialised successfully - start tracking");
	ClientMessage("FaceAPI initialised successfully - start tracking");
	bFaceInit = true;
}

function RemoveOldSnapShots()
{
	local int i;

	for (i = 0; i < SnapShotSamples.length; i++)
	{
		if (`TimeSince(SnapShotSamples[i].Time) >= MaxSampleTime)
			SnapShotSamples.Remove(i, 1);
	}
}

function AddSnapShot(UDKHeadPoseData HPD)
{
	local int Index;

	Index = SnapShotSamples.Length;
	// increase the sample array size
	SnapShotSamples.Length = SnapShotSamples.Length + 1;

	// add current head pose data to head smoothing data array
	// create the snap shot data, converted to unreal units for ease of use
	SnapShotSamples[Index].Value[hdi_Yaw] = HPD.head_rot.Y * RadToUnrRot;
	SnapShotSamples[Index].Value[hdi_Pitch] = HPD.head_rot.X * RadToUnrRot;

	// remember when this was added
	SnapShotSamples[Index].Time = WorldInfo.TimeSeconds;
}

function CalculateRecent()
{
	local int i, j;

	// clear data & count
	for(i = 0; i < eHDIs.EnumCount; i++)
	{
		OldRecentData[i] = RecentData[i];
		RecentData[i] = 0;
		RecentCount[i] = 0;
	}
	
	// now go through all our samples...
	for(i = 0; i < SnapShotSamples.Length; i++)
	{
		if (`TimeSince(SnapShotSamples[i].Time) <= RecentSampleTime)
		{
			for (j = 0; j < eHDIs.EnumCount; j++)
			{
				RecentData[j] += SnapShotSamples[i].Value[j];
				RecentCount[j]++;
			}
		}
	}

	// if we have a count, devide any data we have by the count to get the average
	for (i = 0; i < eHDIs.EnumCount; i++)
	{
		if ((abs(RecentData[i]) - abs(OldRecentData[i])) < RecentErrorMargin[i])
			RecentData[i] = OldRecentData[i];
			
		if (RecentCount[i] > 0)
			RecentData[i] /= RecentCount[i];
	}
}

function CalculateNeutralPosition()
{
	local int i, j;

	// clear data & count
	for(i = 0; i < eHDIs.EnumCount; i++)
	{
		OldNeutralData[i] = NeutralData[i];
		NeutralData[i] = 0;
		NeutralCount[i] = 0;
	}
	
	// now go through all our samples...
	for(i = 0; i < SnapShotSamples.Length; i++)
	{
		if (`TimeSince(SnapShotSamples[i].Time) > RecentSampleTime)
		{
			for (j = 0; j < eHDIs.EnumCount; j++)
			{
				NeutralData[j] += SnapShotSamples[i].Value[j];
				NeutralCount[j]++;
			}
		}
	}

	// if we have a count, devide any data we have by the count to get the average
	for (i = 0; i < eHDIs.EnumCount; i++)
	{
		if (NeutralCount[i] > 0)
			NeutralData[i] /= NeutralCount[i];
		else
			NeutralData[i] = OldNeutralData[i];
	}
}


event HandleFaceTracking(float DeltaTime, float FOVScale)
{
	local rotator newVO;
	local bool GetHPDFail;
	local UDKHeadPoseData HPD;
	local int i;
	local float fRatio;

	if (!bFaceInit)
		return;

	GetHPDFail = ReturnOnError(GetHeadPoseData(HPD)); //, false));
	
	if (GetHPDFail)
	{
		if (!bGetHPDFailed)
		{
			`log(self$" HandleFaceTracking(): could not get head pose data");
			ClientMessage(self$" HandleFaceTracking(): could not get head pose data");
			
			aFaceYaw = 0;
			aFacePitch = 0;
			SnapShotStart = 0;
		}
		
		bGetHPDFailed = true;
		newVO.Yaw = 0;
		newVO.Pitch = 0;
		
		ViewOffset = RInterpTo(ViewOffset, newVO, DeltaTime, voIntSpeed, voContIntSpeed);
		
		return;
	}

	bGetHPDFailed = false;
	
	// if we have never taken a snapshot before (or it reset), set the start time
	if (SnapShotStart == 0)
		SnapShotStart = WorldInfo.TimeSeconds;

	RemoveOldSnapShots();
	AddSnapShot(HPD);

	// not enough samples yet, add everything
	if (`TimeSince(SnapShotStart) < MinSampleTime)
		return;

	CalculateRecent();
	CalculateNeutralPosition();
	for (i = 0; i < eHDIs.EnumCount; i++)
	{
		if (RecentData[i] > NeutralData[i] + DeadZone[i]) 
			aFace[i] = RecentData[i] - (NeutralData[i] + DeadZone[i]);
		else if (RecentData[i] < NeutralData[i] - DeadZone[i])
			aFace[i] = RecentData[i] - (NeutralData[i] - DeadZone[i]);
		else
			aFace[i] = 0;
	}

	fRatio = abs(aFace[hdi_Yaw]) / float(OuterZone[hdi_Yaw] - DeadZone[hdi_Yaw]);
	newVO.Yaw = Clamp(aFace[hdi_Yaw] * -fRatio, -16384, 16383);
	
	fRatio = abs(aFace[hdi_Pitch]) / float(OuterZone[hdi_Pitch] - DeadZone[hdi_Pitch]);
	newVO.Pitch = Clamp(aFace[hdi_Pitch] * fRatio, -16384, 16383);
		
	ViewOffset = RInterpTo(ViewOffset, newVO, DeltaTime, voIntSpeed, voContIntSpeed);
}

simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	local Canvas C;

	C = HUD.Canvas;
	
	C.SetDrawColor(255, 255, 0);
	C.SetPos(4, out_YPos);

	if (!bFaceInit)
	{
		C.DrawText("Face API DISABLED");
		out_YPos += out_YL;
		return;
	}

	C.DrawText("Face API Enabled");
	out_YPos += out_YL;
	C.DrawText("DeadZone Y/P: "$DeadZone[hdi_Yaw] * UnrRotToDeg$"/"$DeadZone[hdi_Pitch] * UnrRotToDeg);
	out_YPos += out_YL;
	C.DrawText("Neutral Point Y/P: "$NeutralData[hdi_Yaw] * UnrRotToDeg$"/"$NeutralData[hdi_Pitch] * UnrRotToDeg);
	out_YPos += out_YL;
	C.DrawText("Recent Point Y/P: "$RecentData[hdi_Yaw] * UnrRotToDeg$"/"$RecentData[hdi_Pitch] * UnrRotToDeg);
	out_YPos += out_YL;
	C.DrawText("Recent Point Y/P: "$ViewOffset.Yaw * UnrRotToDeg$"/"$ViewOffset.Pitch * UnrRotToDeg);
	out_YPos += out_YL;
	
	C.DrawText("Sample Length: "$SnapShotSamples.length);
	out_YPos += out_YL;
	
	//C.DrawText("Average Point Y/P: "$AvgData[hdi_Yaw] * UnrRotToDeg$"/"$AvgData[hdi_Pitch] * UnrRotToDeg);
	//out_YPos += out_YL;
}

defaultproperties
{
}