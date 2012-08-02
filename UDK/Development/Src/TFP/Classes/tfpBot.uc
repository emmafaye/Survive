class tfpBot extends UTBot;

struct ItemsWeDropped
{
	var Inventory Item;
	var float fDroppedWhen;
};

/** Stores the currently stored up ammo */
var array<ItemsWeDropped> RemItems;

function UpdateRecentlyDroppedItems()
{
	local Inventory Item;
	local int i;

	for (i = 0; i < RemItems.Length; i++)
	{
		Item = RemItems[i].Item;
		
		// if an item is dying, been picked up or its simply been a while, forget em'
		if (Item.bDeleteMe || (Item.Instigator != None) || (RemItems[i].fDroppedWhen < WorldInfo.TimeSeconds - 5.0f))
			RemItems.Remove(i,1);
	}
}

function RememberWeDroppedThis(Inventory Item)
{
	local ItemsWeDropped Dropped;
	
	Dropped.Item = Item;
	Dropped.fDroppedWhen = WorldInfo.TimeSeconds;

	RemItems.AddItem(Dropped);
}

function bool WeDroppedThisRecently(Inventory Item)
{
	local int i;

	for (i = 0; i < RemItems.Length; i++)
	{
		if (RemItems[i].Item == Item)
			return true;
	}
	
	return false;
}

exec function SwitchToBestWeapon(optional bool bForceNewWeapon)
{
	UpdateRecentlyDroppedItems();
	if ((Pawn != None) && (Pawn.InvManager != None))
		Pawn.InvManager.SwitchToBestWeapon(bForceNewWeapon);
}
	
defaultproperties
{
}