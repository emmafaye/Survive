class ZombieSpawn extends Actor
Placeable;

var TestZombiePawn spawnedZombiePawn;

defaultproperties
{

}


function SurvivePlayerController GetPlayerController() {
  local SurvivePlayerController playerCtrl;
  foreach DynamicActors(class'SurvivePlayerController', playerCtrl) {
    return playerCtrl;
  }
  return none;
}

function SpawnZombie() {
  local vector offset;
  local SurvivePlayerController playerCtrl;

  if ( spawnedZombiePawn == none ) {
    // get the player's pawn
    playerCtrl = GetPlayerController();
    //CanSeeByPoints( Vector ViewLocation, Vector TestLocation, Rotator ViewRotation );
    if ( playerCtrl != none && playerCtrl.CanSeeByPoints(playerCtrl.Pawn.Location, Location, playerCtrl.Pawn.Rotation) == false ) {
      //`Log("=====spawning zombie");
      offset.Z = 64.0;
      //`Log("TRYING TO SPAWN AT " @ Location);
      spawnedZombiePawn = Spawn( class'TestZombiePawn',self,,Location + offset );
      if ( spawnedZombiePawn != none ) {
        spawnedZombiePawn.bDontPossess = false;
        spawnedZombiePawn.spawnPoint = self;
        spawnedZombiePawn.SpawnDefaultController();
        //`Log("zombie pawn: " @ spawnedZombiePawn);
      }
    } // if ( spawn point is not visible to player )
  }

  if ( spawnedZombiePawn != none )
    ClearTimer('SpawnZombie');
}


function startTimedSpawn() {
  spawnedZombiePawn = none;
  SetTimer(3.0, true, 'SpawnZombie');
}


function ZombieDied() {
  startTimedSpawn();
}

