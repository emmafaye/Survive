class UTMutator_Beretta extends UTMutator;

function InitMutator( string Options, out string ErrorMessage )
{
	UTGame(WorldInfo.Game).DefaultInventory[0] = class 'UTWeap_Beretta';
	super.InitMutator( options, ErrorMessage );
}

function bool CheckReplacement( Actor Other )
{
	// return true to keep this actor
	return true;
}

DefaultProperties
{
}