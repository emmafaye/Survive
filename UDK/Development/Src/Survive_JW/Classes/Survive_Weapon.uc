class Survive_Weapon extends Weapon;

var bool bLight; //Does the weapon have a flashlight attached?
var repnotify bool bLightEnabled; //Is the flashlight enabled?

var Flashlight Flashlight; //An instance of the flashlight.

replication
{
	if (bNetDirty)
		bLightEnabled;
}

simulated function PostBeginPlay()
{
	Flashlight = Spawn(class'Flashlight', self);
	Flashlight.SetBase(self);
	if (bLight)
		Flashlight.LightComponent.SetEnabled(self.default.bLightEnabled);
	super.PostBeginPlay();
}

/**
 * Check on various replicated data and act accordingly.
 */
simulated event ReplicatedEvent(name VarName)
{
	`log(VarName @ "replicated");
	if (VarName == 'bLightEnabled')
	{
		FlashLightToggled();
		`log("bLightEnabled replicated");
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated function toggleFlashlight()
{
	bLightEnabled = !bLightEnabled;
	WorldInfo.Game.Broadcast(self, "Weapon sent trigger");
	FlashLightToggled();
	// if we are a remote client, make sure the Server Set's toggles the flashlight
    if( Role < Role_Authority )
    {
        ServerToggleFlashlight();
    }
}

reliable server function ServerToggleFlashlight()
{
    bLightEnabled = !bLightEnabled;
    `log("ServerToggleFlashlight: " $ bLightEnabled);
    FlashLightToggled();
}

simulated function FlashLightToggled()
{
    if(bLightEnabled)
    {
        FlashLight.LightComponent.SetEnabled(true);
    }
    else
    {
        FlashLight.LightComponent.SetEnabled(false);
    }
}