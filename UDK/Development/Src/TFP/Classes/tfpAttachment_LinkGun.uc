class tfpAttachment_LinkGun extends UTAttachment_LinkGun;

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

defaultproperties
{
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'WP_TFP_LinkGun.Mesh.SK_WP_TFP_LinkGun'
		bUpdateSkelWhenNotRendered=true
		bIgnoreControllersWhenNotRendered=false
		bTickAnimNodesWhenNotRendered=true
	End Object
	WeaponClass=class'tfpWeap_LinkGun'
}