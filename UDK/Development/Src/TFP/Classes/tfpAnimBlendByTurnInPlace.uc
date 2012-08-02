class tfpAnimBlendByTurnInPlace extends tfpAnimBlendByBase;

simulated event TickAnim(float DeltaSeconds)
{
	if (Owner != None)
	{
		if (Owner.LegsTurning == -1)
			NewChildIndex = 1;
		else if (Owner.LegsTurning == 1)
			NewChildIndex = 2;
	}
	
	Super.TickAnim(DeltaSeconds);
}

defaultproperties
{
	NodeName="Turn In Place"
	Children(0)=(Name="Idle",Weight=1.0)
	Children(1)=(Name="Turn Left")
	Children(2)=(Name="Turn Right")
}