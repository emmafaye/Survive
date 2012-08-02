class tfpAnimBlendByLongFall extends tfpAnimBlendByBase;

simulated event TickAnim(float DeltaSeconds)
{
	if ((Owner != None) && Owner.IsLongFall())
		NewChildIndex = 1;
	Super.TickAnim(DeltaSeconds);
}

defaultproperties
{
	NodeName="Long Fall"
	Children(0)=(Name="Default",Weight=1.0)
	Children(1)=(Name="Long Fall")
}