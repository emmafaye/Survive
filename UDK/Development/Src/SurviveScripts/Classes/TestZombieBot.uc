class TestZombieBot extends GameAIController;

var Pawn thePlayer; //variable to hold the target pawn

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

  /*
  // begin added by A.J.
  foreach DynamicActors(class'Pawn', pwn)
  {

  }
  // end added by A.J.
  */
}

event SeePlayer(Pawn SeenPlayer) //bot sees player
{
  if (thePlayer ==none) //if we didnt already see a player
  {
    //`Log("I SEE YOU FOOL");
		thePlayer = SeenPlayer; //make the pawn the target
		GoToState('Follow'); // trigger the movement code
  }
}

state Follow
{
Begin:
		if (thePlayer != None)  // If we seen a player
		{
      //`Log("I'M FOLLOWING");
		  MoveTo(thePlayer.Location); // Move directly to the players location
      GoToState('Looking'); //when we get there
		}
}

state Looking
{
Begin:
  if ( thePlayer != None )  // If we seen a player
  {
    //`Log("I BE LOOKIN'");
		MoveTo(thePlayer.Location); // Move directly to the players location
    GoToState('Follow');  // when we get there
  }
}

defaultproperties
{

}
