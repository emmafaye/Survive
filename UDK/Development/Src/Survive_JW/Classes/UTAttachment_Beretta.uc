/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */
class UTAttachment_Beretta extends UTWeaponAttachment;

var ParticleSystem BeamTemplate;
var class<UDKExplosionLight> ImpactLightClass;
var SceneCapture2DComponent ScopeTest;
var StaticMeshComponent ScopeSM;
var() float ScopeFOV;
var int CurrentPath;

simulated event PostBeginPlay()
{
	Super(Actor).PostBeginPlay();
}


simulated function SpawnBeam(vector Start, vector End, bool bFirstPerson)
{
	local ParticleSystemComponent E;
	local actor HitActor;
	local vector HitNormal, HitLocation;

	if ( End == Vect(0,0,0) )
	{
		if ( !bFirstPerson || (Instigator.Controller == None) )
		{
	    	return;
		}
		// guess using current viewrotation;
		End = Start + vector(Instigator.Controller.Rotation) * class'UTWeap_Beretta'.default.WeaponRange;
		HitActor = Instigator.Trace(HitLocation, HitNormal, End, Start, TRUE, vect(0,0,0),, TRACEFLAG_Bullet);
		if ( HitActor != None )
		{
			End = HitLocation;
		}
	}

	E = WorldInfo.MyEmitterPool.SpawnEmitter(BeamTemplate, Start);
	E.SetVectorParameter('ShockBeamEnd', End);
	if (bFirstPerson && !class'Engine'.static.IsSplitScreen())
	{
		E.SetDepthPriorityGroup(SDPG_Foreground);
	}
	else
	{
		E.SetDepthPriorityGroup(SDPG_World);
	}
}

simulated function FirstPersonFireEffects(Weapon PawnWeapon, vector HitLocation)
{
	local vector EffectLocation;

	Super.FirstPersonFireEffects(PawnWeapon, HitLocation);

	if (Instigator.FiringMode == 0 || Instigator.FiringMode == 3)
	{
		EffectLocation = UTWeapon(PawnWeapon).GetEffectLocation();
		SpawnBeam(EffectLocation, HitLocation, true);

		if (!WorldInfo.bDropDetail && Instigator.Controller != None)
		{
			UDKEmitterPool(WorldInfo.MyEmitterPool).SpawnExplosionLight(ImpactLightClass, HitLocation);
		}
	}
}

simulated function ThirdPersonFireEffects(vector HitLocation)
{
	Super(UTWeaponAttachment).ThirdPersonFireEffects(HitLocation);

	if (EffectIsRelevant(Instigator.Location, false, MaxFireEffectDistance))
		CauseMuzzleFlash();

	if (EffectIsRelevant(Instigator.Location, false, MaxFireEffectDistance))
		SpawnBeam(GetEffectLocation(), HitLocation, false);
}

simulated function bool AllowImpactEffects(Actor HitActor, vector HitLocation, vector HitNormal)
{
	return (HitActor != None && UTProj_Bullet(HitActor) == None && Super.AllowImpactEffects(HitActor, HitLocation, HitNormal));
}

simulated function SetMuzzleFlashParams(ParticleSystemComponent PSC)
{
	local float PathValues[3];
	local int NewPath;
	Super.SetMuzzleFlashparams(PSC);
	if (Instigator.FiringMode == 0)
	{
		NewPath = Rand(3);
		if (NewPath == CurrentPath)
		{
			NewPath++;
		}
		CurrentPath = NewPath % 3;

		PathValues[CurrentPath % 3] = 1.0;
		PSC.SetFloatParameter('Path1',PathValues[0]);
		PSC.SetFloatParameter('Path2',PathValues[1]);
		PSC.SetFloatParameter('Path3',PathValues[2]);
//			CurrentPath++;
	}
	else if (Instigator.FiringMode == 3)
	{
		PSC.SetFloatParameter('Path1',1.0);
		PSC.SetFloatParameter('Path2',1.0);
		PSC.SetFloatParameter('Path3',1.0);
	}
	else
	{
		PSC.SetFloatParameter('Path1',0.0);
		PSC.SetFloatParameter('Path2',0.0);
		PSC.SetFloatParameter('Path3',0.0);
	}

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
	// Weapon SkeletalMesh
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'survive_shared.Mesh.weapon_beretta'
	End Object

	DefaultImpactEffect=(ParticleTemplate=ParticleSystem'WP_ShockRifle.Particles.P_WP_ShockRifle_Beam_Impact', Sound=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_AltFireImpactCue')
	ImpactEffects(0)=(MaterialType=Water, ParticleTemplate=ParticleSystem'WP_LinkGun.Effects.P_WP_Linkgun_Beam_Impact_HIT', Sound=SoundCue'A_Weapon_Link.Cue.A_Weapon_Link_FireCue')
	BulletWhip=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_WhipCue'

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
	
	MuzzleFlashSocket=MuzzleFlashSocket
//	MuzzleFlashPSCTemplate=WP_ShockRifle.Particles.P_ShockRifle_MF_Primary
	MuzzleFlashPSCTemplate=WP_ShockRifle.Particles.P_ShockRifle_3P_MF
	MuzzleFlashAltPSCTemplate=WP_ShockRifle.Particles.P_ShockRifle_3P_MF
	MuzzleFlashColor=(R=255,G=120,B=255,A=255)
	MuzzleFlashDuration=0.33;
	MuzzleFlashLightClass=class'UTGame.UTShockMuzzleFlashLight'
	BeamTemplate=particlesystem'WP_ShockRifle.Particles.P_WP_ShockRifle_Beam'
	WeaponClass=class'UTWeap_Beretta'
	ImpactLightClass=class'UTShockImpactLight'
}
