class MarbleGameInfo extends GameInfo;

var float TimeLeft;

event InitGame(string Options, out string ErrorMessage) {
  Super.InitGame(Options, ErrorMessage);
  
  TimeLeft = 42;
}

event PostLogin(PlayerController NewPlayer) {
  super.PostLogin(NewPlayer);

  MarblePlayerController(NewPlayer).Marble = Spawn(class'MarbleActor', NewPlayer, , NewPlayer.Location);
}

function Tick(float DeltaTime) {
  TimeLeft -= DeltaTime;
}


defaultproperties
{
  PlayerControllerClass=class'MarblePlayerController'
  HUDType=class'Marble.MarbleHUD'
  GameReplicationInfoClass=class'MarbleGameReplicationInfo'
}
