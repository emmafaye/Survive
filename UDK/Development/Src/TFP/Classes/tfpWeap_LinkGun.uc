class tfpWeap_LinkGun extends tfpWeapon;

defaultproperties
{
	FireInterval(0)=+0.07
	AttachmentClass=class'tfpAttachment_LinkGun'
	WeaponColor=(R=255,G=255,B=0,A=255)
	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_LinkGun.Mesh.SK_WP_LinkGun_3P'
	End Object
	WeaponFireTypes(0)=EWFT_Projectile
	WeaponProjectiles(0)=class'tfpProj_LinkPlasma' // UTProj_LinkPowerPlasma if linked (see GetProjectileClass() )
	WeaponEquipSnd=SoundCue'A_Weapon_Link.Cue.A_Weapon_Link_RaiseCue'
	WeaponPutDownSnd=SoundCue'A_Weapon_Link.Cue.A_Weapon_Link_LowerCue'
	WeaponFireSnd(0)=SoundCue'A_Weapon_Link.Cue.A_Weapon_Link_FireCue'
	MaxDesireability=0.7
	AIRating=+0.3
	CurrentRating=+0.3
	bFastRepeater=true
	bInstantHit=false
	bSplashJump=false
	bRecommendSplashDamage=false
	bSniping=false
	InventoryGroup=1
	GroupWeight=0.5
	PickupSound=SoundCue'A_Pickups.Weapons.Cue.A_Pickup_Weapons_Link_Cue'
	AmmoCount=50
	LockerAmmoCount=100
	MaxAmmoCount=100
	IconX=412
	IconY=82
	IconWidth=40
	IconHeight=36
	LockerRotation=(pitch=0,yaw=0,roll=-16384)
	IconCoordinates=(U=453,V=467,UL=147,VL=41)

	PlayerAnimSets(0)=AnimSet'CH_TFP_Male.Anims.Anim_Rifle'
	aimOffset=(X=-2,Y=-6,Z=-10)
	obLowRot=(Pitch=-14000,Roll=5462,Yaw=-5462)
	obLowTrans=(X=0,Y=0,Z=0)
	obLowCrouchRot=(Pitch=-14000,Roll=2731,Yaw=-2731)
	obLowCrouchTrans=(X=0,Y=0,Z=8)
	obHighTrans=(X=0,Y=0,Z=-5)
	obHighRot=(Pitch=10923,Roll=2731,Yaw=-2731)
}
	