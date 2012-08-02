class tfpAttachment_RocketLauncher extends UTAttachment_RocketLauncher;

var SceneCapture2DComponent ScopeTest;
var StaticMeshComponent ScopeSM;
var() float ScopeFOV;

simulated event PostBeginPlay()
{
	Super(Actor).PostBeginPlay();
}

simulated function ThirdPersonFireEffects(vector HitLocation)
{
	Super.ThirdPersonFireEffects(HitLocation);

	if (EffectIsRelevant(Instigator.Location, false, MaxFireEffectDistance))
		CauseMuzzleFlash();
}

/** When an attachment is attached to a pawn, it enters the CurrentlyAttached state.  */
state CurrentlyAttached
{
	simulated function Tick(float DeltaTime)
	{
		local vector NewLocation;
		local rotator NewRotation;

		if ((tfpPawn(Instigator) != None) && Instigator.IsHumanControlled() && Instigator.IsLocallyControlled() && (tfpPlayerController(Instigator.Controller) != None))
		{
			if (tfpPawn(Instigator).bWeaponAiming)
			{
				if (ScopeSM.HiddenGame)
				{
					ScopeSM.SetHidden(false);
					ScopeTest.SetEnabled(true);
					ScopeTest.SetCaptureParameters(TextureRenderTarget2D'WP_TFP_Scope.Materials.ScopeRT2D', ScopeFOV);
				}
				//`log(GetEnum(enum'ENetMode', Instigator.WorldInfo.NetMode) @ self @ GetFuncName());
				Mesh.GetSocketWorldLocationAndRotation(MuzzleFlashSocket, NewLocation, NewRotation);
				ScopeTest.SetView(NewLocation, NewRotation);
			}
			else if (!ScopeSM.HiddenGame)
			{
				ScopeSM.SetHidden(true);
				ScopeTest.SetEnabled(false);
			}
		}
	}
}

simulated function AttachTo(UTPawn OwnerPawn)
{
	Super.AttachTo(OwnerPawn);

	if ((tfpPawn(Instigator) != None) && Instigator.IsHumanControlled() && Instigator.IsLocallyControlled() && (tfpPlayerController(Instigator.Controller) != None))
	{
		ScopeSM.SetShadowParent(OwnerPawn.Mesh);
		ScopeSM.SetLightEnvironment(OwnerPawn.LightEnvironment);
		Mesh.AttachComponentToSocket(ScopeSM, 'SightSocket');
	
		ScopeSM.SetMaterial(0, Material'WP_TFP_Scope.Materials.ScopeRTMat');
	}
}

defaultproperties
{
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'WP_TFP_RocketLauncher.Mesh.SK_WP_TFP_RocketLauncher'
		Scale=1.0
	End Object
	MuzzleFlashSocket=MuzzleFlashSocket
	WeaponClass=class'tfpWeap_RocketLauncher'

	Begin Object Class=SceneCapture2DComponent Name=ScopeTestComponent
		/** near plane clip distance */
		NearPlane=8
		/** far plane clip distance: <= 0 means no far plane */
		FarPlane=0
		/** set to false to disable automatic updates of the view/proj matrices */
		bUpdateMatrices=false
		/** how to draw the scene */
		ViewMode=SceneCapView_Lit
		ClearColor=(R=0,G=255,B=0,A=255)
		bEnablePostProcess=true
		bUseMainScenePostProcessSettings=true
		FrameRate=1000
	End Object
	ScopeTest=ScopeTestComponent
	Components.Add(ScopeTestComponent);	

	Begin Object Class=StaticMeshComponent Name=ScopeStaticMesh
		StaticMesh=StaticMesh'dwStaticMeshes.Plane'
		Rotation=(Yaw=32768)
		CollideActors=false
		Scale=0.0095
		Translation=(X=0,Z=-2.6)
	End Object
	ScopeSM=ScopeStaticMesh
	Components.Add(ScopeStaticMesh);	
	ScopeFOV=6
}