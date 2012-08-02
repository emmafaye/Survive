class tfpInventoryManager extends UTInventoryManager
	config(tfpGame);

// list of weapons we should keep
//	ie. WeaponsToKeep(0)=tfpWeap_LinkGun
var() Array<name> WeaponsToKeep;
var() int MaxWeaponCount;

var class<Actor> LastPickupClass;
var Actor LastPickup;

var bool bDroppingWeaponForPickup;

/*
KeepWeapon
	Checks to see if we're supposed to keep this weapon or not.
*/
function bool KeepWeapon(Weapon CheckWeapon)
{
	local int i;
	
	for(i = 0; i < WeaponsToKeep.Length; i++)
	{
		if (CheckWeapon.Class.Name == WeaponsToKeep[i])
			return true;
	}
	
	return false;
}

/*
WeaponCount
	Returns a count of all weapons, excluding any we should keep.
*/
function int WeaponCount()
{
	local tfpWeapon Weap;
	local int count;

	ForEach InventoryActors(class'tfpWeapon', Weap)
	{
		if (!KeepWeapon(Weap))
	    	count++;
	}

	return count;
}

/*
GetBestWeapon
	Updated to return best empty weapon if best weapon with ammo cannot be found.
*/
simulated function Weapon GetBestWeapon(optional bool bForceADifferentWeapon)
{
	local Weapon W, BestWeapon, BestEmptyWeapon;
	local float Rating, BestRating, BestEmptyRating;

	ForEach InventoryActors(class'Weapon', W)
	{
		if (bForceADifferentWeapon && (W == Instigator.Weapon))
			continue;

		Rating = W.GetWeaponRating();
		
		if (w.HasAnyAmmo())
		{
			if ((BestWeapon == None) || (Rating > BestRating))
			{
				BestWeapon = W;
				BestRating = Rating;
			}
		}
		else
		{
			if ((BestEmptyWeapon == None) || (Rating > BestEmptyRating))
			{
				BestEmptyWeapon = W;
				BestEmptyRating = Rating;
			}
		}
	}

	if ((BestWeapon == None) && (BestEmptyWeapon != None))
		return BestEmptyWeapon;

	return BestWeapon;
}

/*
RemoveFromInventory
	Updated to remove reliance on server to client function calls.
	Kept giving us wrong weapon.
*/
 simulated function RemoveFromInventory(Inventory ItemToRemove)
{
	local Inventory Item;
	local bool		bFound;
	
	if (Role != ROLE_Authority)
		return;

	if (ItemToRemove == None)
		return;
		
	if (InventoryChain == ItemToRemove)
	{
		bFound = TRUE;
		InventoryChain = ItemToRemove.Inventory;
	}
	else
	{
		// If this item is in our inventory chain, unlink it.
		for(Item = InventoryChain; Item != None; Item = Item.Inventory)
		{
			if (Item.Inventory == ItemToRemove)
			{
				bFound = TRUE;
				Item.Inventory = ItemToRemove.Inventory;
				break;
			}
		}
	}

	if (bFound)
	{
		`LogInv("removed" @ ItemToRemove);
		ItemToRemove.ItemRemovedFromInvManager();
		ItemToRemove.SetOwner(None);
		ItemToRemove.Inventory = None;
	}

	// make sure we don't have other references to the item
	if (Instigator.Weapon == ItemToRemove)
		Instigator.Weapon = None;
	
	if (PreviousWeapon == ItemToRemove)
		PreviousWeapon = None;

	if (PendingWeapon == ItemToRemove)
		PendingWeapon = None;

	if ((Instigator.Health > 0) && (Instigator.Weapon == None) && !bDroppingWeaponForPickup)
	{
		if ((PreviousWeapon != None) && (PreviousWeapon != ItemToRemove)
		 && ((PendingWeapon == None) || (PendingWeapon == ItemToRemove)))
			SwitchToPreviousWeapon();
		else if ((PendingWeapon != None) && (PendingWeapon != ItemToRemove))
		{
			`LogInv("Removed current weapon while changing weapons, call ChangedWeapon");
			ChangedWeapon();
		}
		else if (Instigator.Controller != None)
		{
			`LogInv("Calling SwitchToBestWeapon to make sure a weapon is brought up");
			Super(InventoryManager).SwitchToBestWeapon(TRUE);
		}
	}

	if (PendingSwitchWeapon == ItemToRemove)
	{
		PendingSwitchWeapon = None;
		ClearTimer('ProcessRetrySwitch');
	}
}

/*
HandlePickupQuery
	* Added check for Instigator.Controller.MoveTarget,
	  set by AI or manually by player hitting 'use'.
	* Sets pickup class to show item being picked up
*/
function bool HandlePickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	// Check to make sure this is the pickup we want
	if ((Instigator.Controller != None) && (Instigator.Controller.MoveTarget != Pickup))
		return false;

	// Make sure it passes all the usual checks first...
	if (!Super.HandlePickupQuery(ItemClass, Pickup))
		return false;

	// Some special handling for weapons...
	if (class<Weapon>(ItemClass) != None)
	{
		// If we can't drop our current weapon, we're done - don't pick this new weapon up!
		if ((WeaponCount() >= MaxWeaponCount) && (Instigator.FindInventoryType(ItemClass) == None) && (Instigator.Weapon != None))
		{
			if (KeepWeapon(Instigator.Weapon))
				return false;

			// Drop our current weapon, freeing our hands to grab this new one.
			bDroppingWeaponForPickup = true;
			Instigator.ThrowActiveWeapon();
		}

		// If we have no weapon, this one will go straight into our hands so we're done.
		if (Instigator.Weapon == None)
			return true;
	}

	// Track the class of what we just picked up so we can show it being picked up.
	if (Pickup.IsA('UTDroppedPickup') || (Pickup.IsA('PickupFactory') && !Pickup.IsA('UTItemPickupFactory')))
		LastPickupClass = ItemClass;
	else
		LastPickupClass = Pickup.Class;

	// Remember the pickup actor, then set a timer to check the final outcome.
	LastPickup = Pickup;
	SetTimer(0.05, false, 'CheckLastPickup');

	return true;
}

/*
SetCurrentPickup
	Sets the pickup class of the intstigator so item can be shown in offhand
*/
simulated function SetCurrentPickup()
{
	local tfpPawn tfpP;
			
	tfpP = tfpPawn(Instigator);
	if (tfpP != None)
	{
		tfpP.CurrentPickupClass = LastPickupClass;
		tfpP.CurrentPickupChanged();
	}
}


/*
CheckLastPickup
	* Timer set by HandlePickupQuery() (see above)
	* Calls SetCurrentPickup() after checking the status of the last touched pickupfactory (if any)
*/
simulated function CheckLastPickup()
{
	// if a pickup factory is no longer ready to be picked up, it was picked up
	if ((PickupFactory(LastPickup) != None) && PickupFactory(LastPickup).ReadyToPickup(0))
		return;

	SetCurrentPickup();
}


/*
AdjustWeapon
	* removed no ammo check so we can manually select and drop empty weapons
	(coz of max weapons)
*/
simulated function AdjustWeapon(int NewOffset)
{
	local Weapon CurrentWeapon;
	local array<UTWeapon> WeaponList;
	local int i, Index;

	// Don't allow multiple weapon switches very close to one another (seems to happen with some mouse wheels).
	if (WorldInfo.TimeSeconds - LastAdjustWeaponTime < 0.05)
		return;

	LastAdjustWeaponTime = WorldInfo.TimeSeconds;
	
	if (PendingWeapon != None)
		return; // Already changing weapons.

	CurrentWeapon = UTWeapon(PendingWeapon);
	if (CurrentWeapon == None)
		CurrentWeapon = UTWeapon(Instigator.Weapon);

	GetWeaponList(WeaponList);
	if (WeaponList.length < 2)
		return;

	for (i = 0; i < WeaponList.Length; i++)
	{
		if (WeaponList[i] == CurrentWeapon)
		{
			Index = i;
			break;
		}
	}

	Index += NewOffset;
	if (Index < 0)
		Index = WeaponList.Length - 1;
	else if (Index >= WeaponList.Length)
		Index = 0;

	if (Index >= 0)
		SetCurrentWeapon(WeaponList[Index]);
}


/*
ClientWeaponSet
	Weapon just given to a player, check if player should switch to this weapon
	Called from Weapon.ClientWeaponSet()
	Network: LocalPlayer
*/
simulated function ClientWeaponSet(Weapon NewWeapon, bool bOptionalSet, optional bool bDoNotActivate)
{
	local Weapon OldWeapon;

	OldWeapon = Instigator.Weapon;

	// If no current weapon, then set this one.
	if (OldWeapon == None || OldWeapon.bDeleteMe || OldWeapon.IsInState('Inactive'))
	{
		SetCurrentWeapon(NewWeapon);
		return;
	}

	if (OldWeapon == NewWeapon)
		return;

	if (!bOptionalSet)
	{
		SetCurrentWeapon(NewWeapon);
		return;
	}

	// Normally, there'd be a check to see if we should switch to this on pickup.
	// Given that we now manually pickup and drop stuff, we just don't do this.
	NewWeapon.GotoState('Inactive');
}

/*
ChangedWeapon
	Removed SetPuttingDownWeapon() call.
*/
simulated function ChangedWeapon()
{
	local UTWeapon UTW;

	PreviousWeapon = Instigator.Weapon;

	Super(InventoryManager).ChangedWeapon();

	UTW = UTWeapon(Instigator.Weapon);

	// Clear out Pending fires if the weapon doesn't allow them
	if ((UTW != None) && UTW.bNeverForwardPendingFire)
		ClearAllPendingFire(UTW);
}

defaultproperties
{
	MaxWeaponCount=3
	bMustHoldWeapon=false
}