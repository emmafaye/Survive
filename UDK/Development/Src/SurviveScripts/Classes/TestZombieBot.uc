class TestZombieBot extends GameAIController;

var Pawn thePlayer; //variable to hold the target pawn

// mode 0: search for player and attack when player is visible
// mode 1: remain stationary until player is visbible or audible and then attack
// mode 2: remain stationary until bumped or attacked, then attack

var() int AIMode;

var SoundCue ZombieSound;
var NavigationPoint navPoint; // used in state code


function StartChasingPawn(Pawn pawnToChase) {
  if ( pawnToChase != none ) {
    PlaySound(ZombieSound);
    thePlayer = pawnToChase;
    GoToState('Follow');
  }
}

event SeePlayer(Pawn SeenPlayer) {
  if ( thePlayer == none )
    startChasingPawn(SeenPlayer);
}


event HearNoise( float Loudness, Actor NoiseMaker, optional Name NoiseType ) {
  if ( SurvivePawn(NoiseMaker) != none ) {
    if (thePlayer == none)
      startChasingPawn( SurvivePawn(NoiseMaker) );
  }
}


event bool NotifyBump(Actor Other, Vector HitNormal) {
  if ( SurvivePawn(Other) != none ) {
    // the player bumped the zombie so have the zombie pursue the player
    if ( thePlayer == none )
      startChasingPawn( SurvivePawn(Other) );
  }
  
  return super.NotifyBump(Other, HitNormal);
}


function NotifyTakeHit(Controller InstigatedBy, vector HitLocation, int Damage, class<DamageType> damageType, vector Momentum) {
  if ( SurvivePlayerController(InstigatedBy) != none ) {
    // the player has hit the zombie so have the zombie pursue the player
    if (thePlayer == none)
      startChasingPawn(InstigatedBy.Pawn);
  }
}


auto state StartState {
  ignores SeePlayer, HearNoise;

  function Tick(float DeltaTime) {
    if ( AIMode == 0 )
      GoToState('Hunt');
    else if ( AIMode == 2 )
      GoToState('WaitUntilBumpedOrAttacked');
    else
      GoToState('');
  }
}

state Hunt {
Begin:
  // run around until we see or hear the player
  navPoint = FindRandomDest();
  if ( navPoint != none ) {
    MoveTo(navPoint.Location);
    goto 'Begin';
  }
}


state WaitUntilBumpedOrAttacked {
  ignores SeePlayer, HearNoise;
}


state Follow {
Begin:
  if (thePlayer != None) {
    MoveToward(thePlayer);//MoveTo(thePlayer.Location); // Move directly to the players location\
    GoToState('Looking'); //when we get there
  }
}

state Looking
{
Begin:
  if ( thePlayer != None ) {
    MoveToward(thePlayer);//MoveTo(thePlayer.Location); // Move directly to the players location
    GoToState('Follow');  // when we get there
  }
}

defaultproperties
{
  ZombieSound=SoundCue'Survive_Pkg.ZombieSound0'
}
