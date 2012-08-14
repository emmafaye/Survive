class SurvivePlayerController extends UTPlayerController;

defaultproperties
{

}

simulated function PostBeginPlay() {
  super.PostBeginPlay();

  bNoCrosshair = true;
  myHUD.bShowHUD = false;
}


simulated event GetPlayerViewPoint(out vector out_Location, out Rotator out_Rotation)
{
  super.GetPlayerViewPoint(out_Location, out_Rotation);

  myHUD.bShowHUD = false;
  
  // two ways to hide weapon:

  //if ( Pawn.Weapon != none )
  //  Pawn.Weapon.SetHidden(true);

  //WeaponHand = HAND_Hidden;
}



