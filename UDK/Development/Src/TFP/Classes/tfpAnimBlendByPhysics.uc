class tfpAnimBlendByPhysics extends UDKAnimBlendByPhysics
	hidecategories(Animations, UDKAnimBlendByPhysics, Animation, AnimNodeBlendList, AnimNodeBlendBase, AnimNode, Morph);

defaultproperties
{
	CategoryDesc="TFP"
	PhysicsMap(1)=0
	PhysicsMap(2)=1
	PhysicsMap(3)=2
	PhysicsMap(9)=3
	PhysicsMap(10)=4
	Children(0)=(Name="PHYS_Walking",Weight=1.0)
	Children(1)=(Name="PHYS_Falling")
	Children(2)=(Name="PHYS_Swimming")
	Children(3)=(Name="PHYS_Ladder")
	Children(4)=(Name="PHYS_RigidBody")
	LandBlendDelay=0.2	// class'tfpPawn'.default.LandingDelayTime
}
