class UTWeap_Beretta extends tfpWeapon;

simulated function ProcessInstantHit(byte FiringMode, ImpactInfo Impact, optional int NumHits)
{
	local tfpPawn CheckPawn;
	
	if ((Role == Role_Authority) && !bUsingAimingHelp)
	{
		if ((Vehicle(Impact.HitActor) != None) && Vehicle(Impact.HitActor).bDriverIsVisible)
			CheckPawn = tfpPawn(Vehicle(Impact.HitActor).Driver);
		else
			CheckPawn = tfpPawn(Impact.HitActor);
			
		if ((CheckPawn != None) && CheckPawn.IsLocationOnHead(Impact, 1.0f))
		{
			InstantHitDamage[0] = default.InstantHitDamage[0] * 2;
			InstantHitDamageTypes[0] = class'tfpDmgType_ShockHeadShot';
		}	
	}

	Super.ProcessInstantHit(FiringMode, Impact);
	InstantHitDamage[0] = default.InstantHitDamage[0];
	InstantHitDamageTypes[0] = default.InstantHitDamageTypes[0];
}


defaultproperties
{
	AttachmentClass=class'Survive_JW.UTAttachment_Beretta'
	InventoryGroup=4

	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'survive_shared.Mesh.weapon_beretta'
	End Object

	FireInterval(0)=+0.5
	WeaponFireTypes(0)=EWFT_InstantHit
	InstantHitMomentum(0)=+60000.0
	InstantHitDamage(0)=65
	InstantHitDamageTypes(0)=class'UTDmgType_ShockPrimary'
	WeaponFireSnd[0]=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_FireCue'
	WeaponEquipSnd=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_RaiseCue'
	WeaponPutDownSnd=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_LowerCue'
	PickupSound=SoundCue'A_Pickups.Weapons.Cue.A_Pickup_Weapons_Shock_Cue'

	MaxDesireability=0.65
	AIRating=0.65
	CurrentRating=0.65
	bInstantHit=true
	ShouldFireOnRelease(0)=0
	ShotCost(0)=1

	AmmoCount=20
	LockerAmmoCount=40
	MaxAmmoCount=40

	LockerRotation=(Pitch=32768,Roll=16384)

	IconCoordinates=(U=728,V=382,UL=162,VL=45)

	WeaponColor=(R=160,G=0,B=255,A=255)

	GroupWeight=0.5

	IconX=400
	IconY=129
	IconWidth=22
	IconHeight=48

	Begin Object Class=ForceFeedbackWaveform Name=ForceFeedbackWaveformShooting1
		Samples(0)=(LeftAmplitude=90,RightAmplitude=40,LeftFunction=WF_Constant,RightFunction=WF_LinearDecreasing,Duration=0.1200)
	End Object
	WeaponFireWaveForm=ForceFeedbackWaveformShooting1

	PlayerAnimSets(0)=AnimSet'CH_TFP_Male.Anims.Anim_Rifle'
	aimOffset=(X=-2,Y=-2,Z=-11)
	obLowRot=(Pitch=-15109,Roll=5462,Yaw=-5462)
	obLowTrans=(X=0,Y=0,Z=5)
	obLowCrouchRot=(Pitch=-10923,Roll=2731,Yaw=-2731)
	obLowCrouchTrans=(X=0,Y=0,Z=5)
	obHighTrans=(X=0,Y=0,Z=-5)
	obHighRot=(Pitch=10923,Roll=2731,Yaw=-2731)
	// the FOV to use when aiming
	DesiredAimFOV=70
}