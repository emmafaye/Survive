class tfpGame extends UTDeathmatch
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
	Acronym="DM"
	MapPrefixes[0]="DM"
	Name="Default__tfpGame"
	PlayerControllerClass=class'tfpPlayerController'
	DefaultPawnClass=class'tfpPawn'
	BotClass=class'tfpBot'
	bWeaponStay=false
	bRestartLevel=false
	bDelayedStart=false
}