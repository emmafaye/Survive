class tfpPickupAttachment extends Actor
	dependson(tfpPawn);

var PrimitiveComponent PickupMesh;

// For remembering the class of what we just picked up in case we need it (see tfpPawn:CurrentPickupChanged()).
var class<actor> CurrentPickupClass;

/*
SetPickupMesh
	Set the mesh and attach to the player.
*/
simulated function SetPickupMesh(PrimitiveComponent NewPickupMesh, tfpPawn OwnerPawn)
{
	PickupMesh = new(self) NewPickupMesh.Class(NewPickupMesh);
	PickupMesh.SetShadowParent(OwnerPawn.Mesh);
	PickupMesh.SetLightEnvironment(OwnerPawn.LightEnvironment);
	AttachComponent(PickupMesh);

	OwnerPawn.Mesh.AttachComponentToSocket(PickupMesh, OwnerPawn.WeaponSocket2);

	if (StaticMeshComponent(PickupMesh) != None)
	{	
		SetBase(OwnerPawn,, OwnerPawn.Mesh, OwnerPawn.WeaponSocket2);
		SetHardAttach(true);
	}
	
	LifeSpan = (OwnerPawn.TimeToPickup / 2);
}

/*
Setup
	Based on the class of what we just picked up, figure out the correct mesh to use.
*/
simulated function Setup(class<actor> PickupClass)
{
	// Remember the class of what we just picked up in case we need it (see tfpPawn:CurrentPickupChanged()).
	CurrentPickupClass = PickupClass;

	if (class<Inventory>(PickupClass) != None)
		SetPickupMesh(class<Inventory>(PickupClass).default.DroppedPickupMesh, tfpPawn(Instigator));
	else if (class<UTItemPickupFactory>(PickupClass) != None)
		SetPickupMesh(class<UTItemPickupFactory>(PickupClass).default.PickupMesh, tfpPawn(Instigator));
}

defaultproperties
{
	LifeSpan=1.0f	// unless overidden, die in 1 second
}