
class TestZombiePawn extends UTPawn
Placeable;

var Pawn P; // variable to hold the pawn we bump into

// members for the custom mesh
var SkeletalMesh defaultMesh;
var MaterialInterface defaultMaterial0;
var AnimTree defaultAnimTree;
var array<AnimSet> defaultAnimSet;
var AnimNodeSequence defaultAnimSeq;
var PhysicsAsset defaultPhysicsAsset;

simulated function SetCharacterClassFromInfo(class<UTFamilyInfo> Info)
{
	Mesh.SetSkeletalMesh(defaultMesh);
	Mesh.SetMaterial(0,defaultMaterial0);
	Mesh.SetPhysicsAsset(defaultPhysicsAsset);
	Mesh.AnimSets=defaultAnimSet;
	Mesh.SetAnimTreeTemplate(defaultAnimTree);

}

simulated event Bump( Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
{
 `Log("Bump");

     Super.Bump( Other, OtherComp, HitNormal );

	if ( (Other == None) || Other.bStatic )
		return;

  P = Pawn(Other); //the pawn we might have bumped into

	if ( P != None)  //if we hit a pawn
	{
            if (P.Health >1) //as long as pawns health is more than 1
	   {
             P.Health --; // eat brains! mmmmm
           }
        }
}

defaultproperties
{
	defaultMesh=SkeletalMesh'CH_IronGuard_Male.Mesh.SK_CH_IronGuard_MaleA'
	defaultAnimTree=AnimTree'CH_AnimHuman_Tree.AT_CH_Human'
	defaultAnimSet(0)=AnimSet'CH_AnimHuman.Anims.K_AnimHuman_BaseMale'
	defaultPhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'

	Begin Object Name=WPawnSkeletalMeshComponent
		AnimTreeTemplate=AnimTree'CH_AnimHuman_Tree.AT_CH_Human'
	End Object

	RagdollLifespan=180.0
	
	ControllerClass=class'TestZombieBot'
}