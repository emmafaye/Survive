class SurvivePawn extends tfpPawn
config(Game)
notplaceable;

var MyFlashLight FlashLight;
var repnotify bool bIsFlashlightOn; /// whether the flashlight is on or not

replication
{
  // replicated properties
  if ( bNetDirty )
    bIsFlashlightOn;
}

simulated function PostBeginPlay()
{
  // next line changed by A.J.
  FlashLight = Spawn(class'MyFlashLight', self); //FlashLight = Spawn(class'KDFlashLight', self);

  FlashLight.SetBase(self);
  FlashLight.LightComponent.SetEnabled(self.default.bIsFlashlightOn);
  super.PostBeginPlay();
}

/**
* Check on various replicated data and act accordingly.
*/
simulated event ReplicatedEvent(name VarName)
{
  `log(VarName @ "replicated");
  if (VarName == 'bIsFlashlightOn')
  {
    FlashLightToggled();
    `log("bIsFlashlightOn replicated");
  }
  else
  {
    Super.ReplicatedEvent(VarName);
  }
}

simulated function ToggleFlashlight()
{
  bIsFlashlightOn = !bIsFlashlightOn;
  `log("ToggleFlashlight: " $ bIsFlashlightOn);
  FlashLightToggled();
  // if we are a remote client, make sure the Server Set's toggles the flashlight
  `log("Role:" @ Role);
  if( Role < Role_Authority )
  {
    ServerToggleFlashlight();
  }
}

reliable server function ServerToggleFlashlight()
{
  bIsFlashlightOn = !bIsFlashlightOn;
  //`log("ServerToggleFlashlight: " $ bIsFlashlightOn);
  FlashLightToggled(); // A.J. //FlashLightToggled(bIsFlashlightOn);
}


simulated function FlashLightToggled()
{
  if(bIsFlashlightOn)
  {
    FlashLight.LightComponent.SetEnabled(true);
  }
  else
  {
    FlashLight.LightComponent.SetEnabled(false);
  }
}

defaultproperties
{
bIsFlashlightOn=true
}