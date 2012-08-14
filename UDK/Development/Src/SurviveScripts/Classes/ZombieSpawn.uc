class ZombieSpawn extends Actor
Placeable;

var TestZombiePawn spawnedZombiePawn;

defaultproperties
{

}


simulated event PostBeginPlay() {
  super.PostBeginPlay();

  SetTimer(1.0, false, 'SpawnZombie');
}


function SpawnZombie() {
  local vector offset;
  `Log("=====spawning zombie");
  offset.Z = 64.0;
  `Log("TRYING TO SPAWN AT " @ Location);
  spawnedZombiePawn = Spawn( class'TestZombiePawn',,,Location + offset );
  spawnedZombiePawn.bDontPossess = false;
  `Log("zombie pawn: " @ spawnedZombiePawn);
}