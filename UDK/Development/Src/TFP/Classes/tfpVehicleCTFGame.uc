class tfpVehicleCTFGame extends UTVehicleCTFGame_Content
	config(game);

/*
InitGame
	Slip a base mutator in to replace stuff.
*/
event InitGame( string Options, out string ErrorMessage )
{
	AddMutator("TFP.tfpUT3SupportMutator", false);
	Super.InitGame(Options, ErrorMessage);
}
	
defaultproperties
{
	Acronym="VCTF"
	MapPrefixes[0]="VCTF"
	PlayerControllerClass=class'tfpPlayerController'
	DefaultPawnClass=class'tfpPawn'
	BotClass=class'tfpBot'
	bWeaponStay=false
}