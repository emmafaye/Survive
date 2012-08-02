class tfpCheatManager extends UTCheatManager within GamePlayerController;

/*
AllWeapons
	Give player all available weapons
*/
exec function AllWeapons()
{
	if ((WorldInfo.NetMode != NM_Standalone) || (Pawn == None))
		return;

	GiveWeapon("TFP.tfpWeap_LinkGun");
	GiveWeapon("TFP.tfpWeap_RocketLauncher");
	GiveWeapon("TFP.tfpWeap_ShockRifle");
}

/*
PhysicsGun
	Just say no to phsics guns.
*/
exec function PhysicsGun()
{
}

/*
EditWeapon
	Updated to look for tfpWeapons instead of UTWeapons.
*/
exec function EditWeapon(string WhichWeapon)
{
	local tfpWeapon Weapon;
	local array<string> weaps;
	local string s;
	local int i;
	
	if (WhichWeapon != "")
		ConsoleCommand("Editactor class="$WhichWeapon);
	else
	{
		foreach AllActors(class'tfpWeapon', Weapon)
		{
			s = ""$Weapon.Class;
			if (Weaps.Find(s) < 0)
			{
				Weaps.Length = Weaps.Length + 1;
				Weaps[Weaps.Length-1] = s;
			}
		}

		for (i = 0; i < Weaps.Length; i++)
			`log("Weapon"@i@"="@Weaps[i]);
	}
}

defaultproperties
{
}