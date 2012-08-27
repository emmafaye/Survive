class SurviveGame extends tfpGame;

var array<ZombieSpawn> ZombieSpawners;

simulated function PostBeginPlay()
{
  local ZombieSpawn ZombieSpawner;
  super.PostBeginPlay();
  foreach DynamicActors(class'ZombieSpawn', ZombieSpawner)
    ZombieSpawners[zombieSpawners.length] = ZombieSpawner;
    
  SetTimer(5.0, false, 'ActivateSpawners');
}

function ActivateSpawners()
{
  local int i;
  for ( i=0; i < ZombieSpawners.length; i++ )
    ZombieSpawners[i].startTimedSpawn();
}

defaultproperties
{
  PlayerControllerClass=class'SurviveScripts.SurvivePlayerController'
  DefaultPawnClass=class'SurviveScripts.SurvivePawn'
  //DefaultInventory(0)=none
}