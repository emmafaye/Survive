class tfpPlaceablePawn extends tfpPawn
	placeable;
	
simulated function Tick(float DeltaTime)
{
}

simulated function TickSpecial( float DeltaTime )
{
}

defaultproperties
{
	Physics = PHYS_Falling
	bDontPossess = TRUE
	bRunPhysicsWithNoController = TRUE
}
