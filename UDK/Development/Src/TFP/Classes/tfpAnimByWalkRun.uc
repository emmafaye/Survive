class tfpAnimByWalkRun extends tfpAnimBlendByBase;

simulated event TickAnim(float DeltaSeconds)
{
	if ((Owner != None) && Owner.IsRunning())
		NewChildIndex = 1;
		
	Super.TickAnim(DeltaSeconds);
}

defaultproperties
{
	NodeName="Walk / Run"
	Children(0)=(Name="Walk",Weight=1.0)
	Children(1)=(Name="Run")
}