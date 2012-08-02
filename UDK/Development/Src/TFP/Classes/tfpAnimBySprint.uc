class tfpAnimBySprint extends tfpAnimBlendByBase;

simulated event TickAnim(float DeltaSeconds)
{
	if ((Owner != None) && Owner.IsSprinting())
		NewChildIndex = 1;
	
	Super.TickAnim(DeltaSeconds);
}

defaultproperties
{
	NodeName="Sprinting"
	Children(0)=(Name="Not Sprinting",Weight=1.0)
	Children(1)=(Name="Sprinting")
}