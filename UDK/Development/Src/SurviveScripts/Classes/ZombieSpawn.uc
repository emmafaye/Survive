class ZombieSpawn extends Actor
Placeable;

var TestZombiePawn spawnedZombiePawn;

defaultproperties
{

}


simulated event PostBeginPlay() {
  super.PostBeginPlay();

  SetTimer(5.0, false, 'SpawnZombie');
}


function SpawnZombie() {
  local vector offset;
  `Log("=====spawning zombie");
  offset.Z = 64.0;
  //`Log("TRYING TO SPAWN AT " @ Location);
  spawnedZombiePawn = Spawn( class'TestZombiePawn',,,Location + offset );
  spawnedZombiePawn.bDontPossess = false;
  spawnedZombiePawn.SpawnDefaultController();
  `Log("zombie pawn: " @ spawnedZombiePawn);
}