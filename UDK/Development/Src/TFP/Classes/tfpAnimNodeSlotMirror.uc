class tfpAnimNodeSlotMirror extends AnimNodeSlot;

var AnimNodeMirror MirrorSlot;

/*
OnInit
*/
simulated event OnInit()
{
	local UDKAnimBlendBySlotActive AnimSlotActive;

	// Find our parent.
	MirrorSlot = AnimNodeMirror(ParentNodes[0]);
	if (MirrorSlot == None)
	{
		`log(self @ GetFuncName() @ "ERROR: ParentNodes[0] is not AnimNodeMirror");
		return;
	}

	// Find our parent's parent.
	AnimSlotActive = UDKAnimBlendBySlotActive(MirrorSlot.ParentNodes[0]);
	if (AnimSlotActive == None)
	{
		`log(self @ GetFuncName() @ "ERROR: MirrorSlot (" @ MirrorSlot @ ") ParentNodes[0] is not UDKAnimBlendBySlotActive");
		return;
	}
	
	// Set our parent's parent's child slot to our selves.
	AnimSlotActive.ChildSlot = Self;
}

/*
PlayCustomMirrorAnim
	Exactly the same as PlayCustomAnim, except has bMirror option (mirror or not)
*/
final function float PlayCustomMirrorAnim
(
	name	AnimName,
	float	Rate,
	optional bool bMirror,
	optional	float	BlendInTime,
	optional	float	BlendOutTime,
	optional	bool	bLooping,
	optional	bool	bOverride,
	optional	float	StartTime,
	optional	float	EndTime
)
{
	MirrorSlot.bEnableMirroring = bMirror;
	return PlayCustomAnim(AnimName,Rate,BlendInTime,BlendOutTime,bLooping,bOverride,StartTime,EndTime);
}

/*
PlayCustomMirrorAnimByDuration
	Exactly the same as PlayCustomAnimByDurationMirror, except has bMirror option (mirror or not)
*/
final function bool PlayCustomMirrorAnimByDuration
(
	name AnimName,
	float Duration,
	optional bool bMirror,
	optional float BlendInTime,
	optional float BlendOutTime,
	optional bool bLooping,
	optional bool bOverride = TRUE
)
{
	MirrorSlot.bEnableMirroring = bMirror;
	return PlayCustomAnimByDuration(AnimName,Duration,BlendInTime,BlendOutTime,bLooping,bOverride);
}

defaultproperties
{
	bCallScriptEventOnInit=true
}