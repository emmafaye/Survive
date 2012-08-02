class tfpWeaponLockerPickup extends UTDroppedPickup
	notplaceable;

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'bFadeOut')
	{
		if (bFadeOut == true)
			GotoState('Fadeout');
		else
			GotoState('Pickup');
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

function GiveTo( Pawn P )
{
	local tfpWeapon Copy;
	
	Copy = tfpWeapon(Spawn(InventoryClass));
	
	if (Copy != None)
	{
		Copy.AnnouncePickup(P);
		Copy.GiveTo(P);
	}
	else
		`log(self$" failed to spawn "$InventoryClass);
	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "InventoryClass:" @ InventoryClass @ "Pawn: " @ P);
	PickedUpBy(P);
}

function PickedUpBy(Pawn P)
{
	//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetFuncName() @ "Pawn:" @ P);
	GotoState('FadeOut');
}

State FadeOut
{
	function bool ValidTouch(Pawn Other)
	{
		return false;
	}
	
	event Timer()
	{
		GotoState('Pickup');
	}

	event EndState(Name NextStateName)
	{
		//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetStateName() @ GetFuncName());
		SetHidden(false);
		bFadeOut = false;
	}
	
	simulated event BeginState(Name PreviousStateName)
	{
		//`log(GetEnum(enum'ENetMode', WorldInfo.NetMode) @ self @ GetStateName() @ GetFuncName() @ "PreviousStateName:" @ PreviousStateName );
		bFadeOut = true;
		SetHidden(true);
		SetTimer(30, false);
	}
}
	
defaultproperties
{
	LifeSpan=0.0f
}