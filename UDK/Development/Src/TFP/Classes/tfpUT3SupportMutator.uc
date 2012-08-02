class tfpUT3SupportMutator extends UTMutator;

struct ReplacementInfo
{
	/** class name of the weapon we want to get rid of */
	var name OldClassName;
	/** fully qualified path of the class to replace it with */
	var string NewClassPath;
};

var array<ReplacementInfo> WeaponsToReplace;
var array<ReplacementInfo> AmmoToReplace;

function WeaponLockerHack()
{
	local UTWeaponLocker Locker;
	local Inventory Item;
	local DroppedPickup P;
	local int i, Index;
	local vector wLoc;
	local rotator wRot;
	
	ForEach WorldInfo.AllNavigationPoints(class'UTWeaponLocker',Locker)
	{
		for (i = 0; i < Locker.Weapons.length; i++)
		{
			if (Locker.Weapons[i].WeaponClass != None)
			{
				Index = WeaponsToReplace.Find('OldClassName', Locker.Weapons[i].WeaponClass.Name);
				if (Index != INDEX_NONE)
				{
					// replace with nothing
					if (WeaponsToReplace[Index].NewClassPath == "")
						Locker.ReplaceWeapon(i, None);
					else
						Locker.ReplaceWeapon(i, class<UTWeapon>(DynamicLoadObject(WeaponsToReplace[Index].NewClassPath, class'Class')));
				}
			}
		}
	
		for (i = 0; i < Locker.Weapons.length && i < Locker.LockerPositions.length; i++)
		{
			wLoc = Locker.Location + Locker.LockerPositions[i] + Locker.Weapons[i].WeaponClass.default.LockerOffset;
			wRot = Locker.Weapons[i].WeaponClass.default.LockerRotation;

			Item = Spawn(Locker.Weapons[i].WeaponClass,,, wLoc, wRot);

			if (Item != None)
			{
				P = Spawn(class'tfpWeaponLockerPickup',,, wLoc, wRot);
				if(P != None)
				{
					P.Inventory	= Item;
					P.InventoryClass = Item.class;
					P.Velocity = vect(0,0,0);
					P.SetOwner(Locker);
					P.SetPickupMesh(Item.DroppedPickupMesh);
					P.SetPickupParticles(Item.DroppedPickupParticles);
				}
				else
					Item.Destroy();
			}
			Locker.ReplaceWeapon(i, None);
			Locker.GotoState('Disabled');
			Locker.ClearTimer('DestroyWeapons');
		}
	}
}

function PostBeginPlay()
{
	local UTGame Game;
	local int i, Index;
	
	SetTimer(0.1, false, nameof(WeaponLockerHack));

	Super.PostBeginPlay();

	// replace default weapons
	Game = UTGame(WorldInfo.Game);
	if (Game != None)
	{
		for (i = 0; i < Game.DefaultInventory.length; i++)
		{
			if (Game.DefaultInventory[i] != None)
			{
				Index = WeaponsToReplace.Find('OldClassName', Game.DefaultInventory[i].Name);
				if (Index != INDEX_NONE)
				{
					if (WeaponsToReplace[Index].NewClassPath == "")
					{
						// replace with nothing
						Game.DefaultInventory.Remove(i, 1);
						i--;
					}
					Game.DefaultInventory[i] = class<UTWeapon>(DynamicLoadObject(WeaponsToReplace[Index].NewClassPath, class'Class'));
				}
			}
		}
	}
}

function bool CheckReplacement(Actor Other)
{
	local UTWeaponPickupFactory WeaponPickup;
	local UTAmmoPickupFactory AmmoPickup, NewAmmo;
	local int Index;
	local class<UTAmmoPickupFactory> NewAmmoClass;

	WeaponPickup = UTWeaponPickupFactory(Other);
	if (WeaponPickup != None)
	{
		if (WeaponPickup.WeaponPickupClass != None)
		{
			Index = WeaponsToReplace.Find('OldClassName', WeaponPickup.WeaponPickupClass.Name);
			if (Index != INDEX_NONE)
			{
				if (WeaponsToReplace[Index].NewClassPath == "")
				{
					// replace with nothing
					return false;
				}
				WeaponPickup.WeaponPickupClass = class<UTWeapon>(DynamicLoadObject(WeaponsToReplace[Index].NewClassPath, class'Class'));
				WeaponPickup.InitializePickup();
			}
		}
		
		return true;
	}

	AmmoPickup = UTAmmoPickupFactory(Other);
	if (AmmoPickup != None)
	{
		Index = AmmoToReplace.Find('OldClassName', AmmoPickup.Class.Name);
		if (Index != INDEX_NONE)
		{
			if (AmmoToReplace[Index].NewClassPath == "")
			{
				// replace with nothing
				return false;
			}
			NewAmmoClass = class<UTAmmoPickupFactory>(DynamicLoadObject(AmmoToReplace[Index].NewClassPath, class'Class'));
			if (NewAmmoClass == None)
			{
				// replace with nothing
				return false;
			}
			else if (NewAmmoClass.default.bStatic || NewAmmoClass.default.bNoDelete)
			{
				// transform the current ammo into the desired class
				//AmmoPickup.TransformAmmoType(NewAmmoClass);
				//`Log(self$" >>> CheckReplacement() - replace "$AmmoPickup.TargetWeapon);
				AmmoPickup.TargetWeapon = NewAmmoClass.default.TargetWeapon;
				//`Log(" with "$AmmoPickup.TargetWeapon);
				return true;
			}
			else
			{
				// spawn the new ammo, link it to the old, then disable the old one
				NewAmmo = AmmoPickup.Spawn(NewAmmoClass);
				NewAmmo.OriginalFactory = AmmoPickup;
				AmmoPickup.ReplacementFactory = NewAmmo;
				return false;
			}
		}
	}

	return true;
}

defaultproperties
{
	WeaponsToReplace(0)=(OldClassName=UTWeap_LinkGun,NewClassPath="TFP.tfpWeap_LinkGun")
	WeaponsToReplace(1)=(OldClassName=UTWeap_RocketLauncher_Content,NewClassPath="TFP.tfpWeap_RocketLauncher")
	WeaponsToReplace(2)=(OldClassName=UTWeap_ShockRifle,NewClassPath="TFP.tfpWeap_ShockRifle")
	AmmoToReplace(0)=(OldClassName=UTAmmo_LinkGun,NewClassPath="TFP.tfpAmmo_LinkGun")
	AmmoToReplace(1)=(OldClassName=UTAmmo_RocketLauncher,NewClassPath="TFP.tfpAmmo_RocketLauncher")
	AmmoToReplace(2)=(OldClassName=UTAmmo_ShockRifle,NewClassPath="TFP.tfpAmmo_ShockRifle")
}