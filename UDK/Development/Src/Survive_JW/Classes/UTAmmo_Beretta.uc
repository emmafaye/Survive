/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */
class UTAmmo_Beretta extends UTAmmoPickupFactory;

defaultproperties
{
	AmmoAmount=16
	TargetWeapon=class'UTWeap_BerettaBase'
	PickupSound=SoundCue'A_Pickups.Ammo.Cue.A_Pickup_Ammo_Shock_Cue'
	MaxDesireability=0.28

	Begin Object Name=AmmoMeshComp
		StaticMesh=StaticMesh'Pickups.Ammo_Shock.Mesh.S_Ammo_ShockRifle'
		Translation=(X=0.0,Y=0.0,Z=-15.0)
	End Object

	Begin Object Name=CollisionCylinder
		CollisionHeight=14.4
	End Object
}
