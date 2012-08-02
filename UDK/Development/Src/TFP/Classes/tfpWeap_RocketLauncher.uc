class tfpWeap_RocketLauncher extends tfpWeapon;

/*********************************************************************************************
 * AI Interface
 *********************************************************************************************/

function float SuggestAttackStyle()
{
	local float EnemyDist;

	if (Instigator.Controller.Enemy != None)
	{
		// recommend backing off if target is too close
		EnemyDist = VSize(Instigator.Controller.Enemy.Location - Owner.Location);
		if ( EnemyDist < 750 )
		{
			return (EnemyDist < 500) ? -1.5 : -0.7;
		}
		else if (EnemyDist > 1600)
		{
			return 0.5;
		}
	}

	return -0.1;
}

// tell bot how valuable this weapon would be to use, based on the bot's combat situation
// also suggest whether to use regular or alternate fire mode
function float GetAIRating()
{
	local UTBot B;
	local float EnemyDist, Rating, ZDiff;
	local vector EnemyDir;

	B = UTBot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return AIRating;

	// if standing on a lift, make sure not about to go around a corner and lose sight of target
	// (don't want to blow up a rocket in bot's face)
	if ( (Instigator.Base != None) && (Instigator.Base.Velocity != vect(0,0,0))
		&& !B.CheckFutureSight(0.1) )
		return 0.1;

	EnemyDir = B.Enemy.Location - Instigator.Location;
	EnemyDist = VSize(EnemyDir);
	Rating = AIRating;

	// don't pick rocket launcher if enemy is too close
	if ( EnemyDist < 360 )
	{
		if ( Instigator.Weapon == self )
		{
			// don't switch away from rocket launcher unless really bad tactical situation
			if ( (EnemyDist > 250) || ((Instigator.Health < 50) && (Instigator.Health < B.Enemy.Health - 30)) )
				return Rating;
		}
		return 0.05 + EnemyDist * 0.001;
	}

	// rockets are good if higher than target, bad if lower than target
	ZDiff = Instigator.Location.Z - B.Enemy.Location.Z;
	if ( ZDiff > 120 )
		Rating += 0.25;
	else if ( ZDiff < -160 )
		Rating -= 0.35;
	else if ( ZDiff < -80 )
		Rating -= 0.05;
	if ( (B.Enemy.Weapon != None) && B.Enemy.Weapon.bMeleeWeapon && (EnemyDist < 2500) )
		Rating += 0.25;

	return Rating;
}

defaultproperties
{
	FireInterval(0)=+0.75
	AttachmentClass=class'tfpAttachment_RocketLauncher'
	InventoryGroup=8
	WeaponColor=(R=255,G=0,B=0,A=255)

	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_RocketLauncher.Mesh.SK_WP_RocketLauncher_3P'
	End Object

	WeaponFireSnd[0]=SoundCue'A_Weapon_RocketLauncher.Cue.A_Weapon_RL_Fire_Cue'
	WeaponEquipSnd=SoundCue'A_Weapon_RocketLauncher.Cue.A_Weapon_RL_Raise_Cue'

	WeaponProjectiles(0)=class'UTProj_Rocket'

	MaxDesireability=0.78
	AIRating=+0.78
	CurrentRating=+0.78
	bInstantHit=false
	bSplashJump=true
	bRecommendSplashDamage=true
	bSniping=false
	ShouldFireOnRelease(0)=0
	GroupWeight=0.5

	PickupSound=SoundCue'A_Pickups.Weapons.Cue.A_Pickup_Weapons_Rocket_Cue'

	AmmoCount=15
	LockerAmmoCount=30
	MaxAmmoCount=30
	WeaponFireTypes(0)=EWFT_Projectile
	IconX=460
	IconY=34
	IconWidth=51
	IconHeight=38
	EquipTime=+0.6
	JumpDamping=0.75
	LockerRotation=(pitch=0,yaw=0,roll=-16384)
	IconCoordinates=(U=131,V=379,UL=129,VL=50)
	WeaponPutDownSnd=SoundCue'A_Weapon_RocketLauncher.Cue.A_Weapon_RL_Lower_Cue'
	Begin Object Class=ForceFeedbackWaveform Name=ForceFeedbackWaveformShooting1
		Samples(0)=(LeftAmplitude=90,RightAmplitude=50,LeftFunction=WF_LinearDecreasing,RightFunction=WF_LinearDecreasing,Duration=0.200)
	End Object
	WeaponFireWaveForm=ForceFeedbackWaveformShooting1

	PlayerAnimSets(0)=AnimSet'CH_TFP_Male.Anims.Anim_Support'
	aimOffset=(X=-1,Y=-6,Z=-16.5)
	obHighTrans=(X=0,Y=0,Z=-5)
	obHighRot=(Pitch=10923,Roll=2731,Yaw=-2731)
}