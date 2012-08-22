class SurvivePlayerController extends tfpPlayerController;

// bBehindView = true // for some reason this guy wanted a 3rd person camera

defaultproperties
{

}

simulated function PostBeginPlay() {
  super.PostBeginPlay();

  bNoCrosshair = true;
  if ( myHUD != none )
    myHUD.bShowHUD = false;
}


simulated event GetPlayerViewPoint(out vector out_Location, out Rotator out_Rotation)
{
  super.GetPlayerViewPoint(out_Location, out_Rotation);

  if ( myHUD != none )
    myHUD.bShowHUD = false;

  // two ways to hide weapon:

  //if ( Pawn.Weapon != none )
  //  Pawn.Weapon.SetHidden(true);

  //WeaponHand = HAND_Hidden;
}


exec function ToggleFlashlight()
{
  //`log('TRYING TO TOGGLE FLASHLIGHT');
  if ( SurvivePawn(Pawn) != none )
    SurvivePawn(Pawn).ToggleFlashlight();
}

/*
state Dead
{
  function EndState(name NextStateName)
  {
    SetBehindView(default.bBehindView);
  }
}
*/
