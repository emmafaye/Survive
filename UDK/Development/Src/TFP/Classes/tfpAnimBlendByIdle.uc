class tfpAnimBlendByIdle extends tfpAnimBlendByBase;

var SkelControlSingleBone CachedRR;

/*
OnInit
	Grabs a pointer to the 'RootRot' skeletal controller.
*/
simulated event OnInit()
{
	Super.OnInit();
	CachedRR = SkelControlSingleBone(SkelComponent.FindSkelControl('RootRot'));
}

simulated event TickAnim(float DeltaSeconds)
{
	if (Owner != None)
	{
		// If we're moving a reasonable amount, we're no longer idle.
		if (VSizeSq2D(Owner.Velocity) > 50.0f)
			NewChildIndex = 1;

		// Set RootRot angles
		// FIXME - move this to node that is used ONCE instead of multiple times (as this now is)
		CachedRR.BoneRotation.Pitch = Owner.LegsOffset.Pitch;
		CachedRR.BoneRotation.Yaw = Owner.LegsOffset.Yaw;
		CachedRR.BoneRotation.Pitch = Owner.LegsOffset.Roll;
	}
	
	Super.TickAnim(DeltaSeconds);
}

defaultproperties
{
	NodeName="Idle / Moving"
	Children(0)=(Name="Idle",Weight=1.0)
	Children(1)=(Name="Moving")
}