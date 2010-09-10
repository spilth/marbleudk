class MarbleActor extends KActorSpawnable
	placeable;

DefaultProperties
{
	Begin Object Name=StaticMeshComponent0
		StaticMesh=StaticMesh'MarbleMeshes.Player.Sphere'
		bNotifyRigidBodyCollision=true
		HiddenGame=FALSE
		CollideActors=TRUE
		BlockActors=TRUE
		AlwaysCheckCollision=TRUE
		ScriptRigidBodyCollisionThreshold=0.001
		LightingChannels=(Dynamic=TRUE)
		DepthPriorityGroup=SDPG_Foreground
	End Object
	Components.Add(StaticMeshComponent0)
	DrawScale=0.8
}
