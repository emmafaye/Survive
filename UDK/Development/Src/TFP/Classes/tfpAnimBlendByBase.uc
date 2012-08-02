class tfpAnimBlendByBase extends UDKAnimBlendBase
	dependson(tfpPawn)
	hidecategories(AnimNodeBlendList, AnimNodeBlendBase, AnimNode, Morph)
	abstract;

var tfpPawn Owner;
var int OldActiveChildIndex, NewChildIndex;
var bool bDefaultChildZero;

/*
OnInit
	Grabs a pointer to the 'RootRot' skeletal controller & the owning pawn, if possible.
	Remembers the original ActiveChildIndex.
*/
simulated event OnInit()
{
	Super.OnInit();

	OldActiveChildIndex = ActiveChildIndex;
	
	// Call me paranoid, but I must insist on checking for both of these on init
	if ((SkelComponent != None) && (tfpPawn(SkelComponent.Owner) != None))
		Owner = tfpPawn(SkelComponent.Owner);
}

/*
TickAnim
	Checks owner for X condition.
	Sets new child if found or defaults to 0.
*/
simulated event TickAnim(float DeltaSeconds)
{
	if (Owner == None)
	{
		// ** EDITOR ONLY **
		if (OldActiveChildIndex != ActiveChildIndex)
			SetSlaveActiveChild();
		return;
	}

	if (ActiveChildIndex != NewChildIndex)
		SetActiveChild(NewChildIndex, BlendTime);
		
	// Default back to 0 every frame, unless told not too.
	if (bDefaultChildZero)
		NewChildIndex = 0;
}

/*
SetSlaveActiveChild
	Sets all similar animation nodes to the same active child.
	** EDITOR ONLY **
*/
function SetSlaveActiveChild()
{
	local tfpAnimBlendByBase ByBase;

	OldActiveChildIndex = ActiveChildIndex;

	foreach SkelComponent.AllAnimNodes(class'tfpAnimBlendByBase', ByBase)
	{
		if ((ByBase != Self) && (ByBase.Class == Self.Class))
		{
			ByBase.SetActiveChild(ActiveChildIndex, ByBase.BlendTime);
			ByBase.OldActiveChildIndex = ActiveChildIndex;
		}
	}
}

defaultproperties
{
	CategoryDesc="TFP"
	bFixNumChildren=true
	bTickAnimInScript=true
	bPlayActiveChild=true
	bCallScriptEventOnInit=true
	bDefaultChildZero=true
}