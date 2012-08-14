class TestZombiePawn extends UTPawn
Placeable;

var Pawn P; // variable to hold the pawn we bump into
var() int DamageAmount;   //how much brain to munch

simulated function PostBeginPlay()
{
   super.PostBeginPlay();

   //wake the physics up
   SetPhysics(PHYS_Falling);
}

//over-ride epics silly character stuff
simulated function SetCharacterClassFromInfo(class<UTFamilyInfo> Info)
{
	Return;
}

simulated event Bump( Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
{
 //`Log("Bump");

     Super.Bump( Other, OtherComp, HitNormal );

	if ( (Other == None) || Other.bStatic )
		return;

  P = Pawn(Other); //the pawn we might have bumped into

	if ( P != None)  //if we hit a pawn
	{
            if (TestZombiePawn(Other) != None)  //we hit another zombie
            {
               Return; //dont do owt
            }
            else
            {
             //use a timer so it just takes health once each encounter
             //theres other better ways of doing this probably
            SetTimer(0.1, false, 'EatSlow');
            }
     }
}

simulated function EatSlow()
{
    P.Health -= DamageAmount; // eat brains! mmmmm

    if (P.Health <= 0)//if the pawn has no health
     {
     P.Destroy();  //kill it
     }
}

defaultproperties
{
	Begin Object Name=WPawnSkeletalMeshComponent
		AnimTreeTemplate=AnimTree'CH_AnimHuman_Tree.AT_CH_Human'
		SkeletalMesh=SkeletalMesh'CH_IronGuard_Male.Mesh.SK_CH_IronGuard_MaleA'
		AnimSets(0)=AnimSet'CH_AnimHuman.Anims.K_AnimHuman_BaseMale'
		PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
	End Object

	RagdollLifespan=180.0 //how long the dead body will hang around for

	AirSpeed=200
	GroundSpeed=200

	ControllerClass=class'TestZombieBot'
	bDontPossess=false

	DamageAmount=10
}