class MarblePlayerController extends PlayerController;

var MarbleActor Marble;

var float DefaultImpulse;
var float CameraDistance, CameraFOV;
var int CameraPitchAngle, CameraYawAngle;

auto state PlayerWaiting
{
	simulated function PlayerMove(float DeltaTime) {
		super.PlayerMove(DeltaTime);
		
		if (PlayerInput.aForward > 0) {
			Marble.ApplyImpulse(vect(1,0,0), DefaultImpulse, vect(0,0,0));
		}

		if (PlayerInput.aForward < 0) {
			Marble.ApplyImpulse(vect(-1,0,0), DefaultImpulse, vect(0,0,0));
		}

		if (PlayerInput.aStrafe > 0) {
			Marble.ApplyImpulse(vect(0,1,0), DefaultImpulse, vect(0,0,0));
		}

		if (PlayerInput.aStrafe < 0) {
			Marble.ApplyImpulse(vect(0,-1,0), DefaultImpulse, vect(0,0,0));
		}

	}
}

event float GetFOVAngle () {
	return CameraFOV;
}

simulated event GetPlayerViewPoint(out vector out_CamLoc, out Rotator out_CamRot)
{
   local float GroundDistance, GroundOffset, HeightOffset;
   GroundDistance = Cos(CameraPitchAngle * UnrRotToRad) * CameraDistance;

   HeightOffset = Sin(CameraPitchAngle * UnrRotToRad) * CameraDistance;
   GroundOffset = Cos(CameraYawAngle * UnrRotToRad) * GroundDistance;

   out_CamLoc = Marble.Location;
   out_CamLoc.Z += HeightOffset;
   out_CamLoc.Y += GroundOffset;
   out_CamLoc.X -= GroundOffset;

   out_CamRot.Pitch = -1 * CameraPitchAngle;
   out_CamRot.Yaw = -1 * CameraYawAngle;
   out_CamRot.Roll = 0;
}

defaultproperties
{
	CameraPitchAngle=6420 //35.264 degrees
	CameraYawAngle=8192   // 45 degrees
	CameraDistance=4096.0
	CameraFOV=20.0
	DefaultImpulse=20.0
}