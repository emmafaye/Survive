class tfpTeamGame extends UTTeamGame
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
	Acronym="TDM"
	MapPrefixes[0]="DM"
	PlayerControllerClass=class'tfpPlayerController'
	DefaultPawnClass=class'tfpPawn'
	BotClass=class'tfpBot'
	bWeaponStay=false
}