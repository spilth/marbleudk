class MarbleGameInfo extends GameInfo;

var float DefaultTimeLeft;
var float TimeLeft;

var MarbleLevelInfo MarbleLevelInfo;

event InitGame(string Options, out string ErrorMessage) {
  Super.InitGame(Options, ErrorMessage);
  
  foreach AllActors(class'MarbleLevelInfo', MarbleLevelInfo) {
    break;
  }
  
  if (MarbleLevelInfo == None) {
    // Warn about missing MarbleLevelInfo
    `log("InitGame: MarbleLevelInfo not found!");
  }
  
}

event PostLogin(PlayerController NewPlayer) {
  super.PostLogin(NewPlayer);

  MarblePlayerController(NewPlayer).Marble = Spawn(class'MarbleActor', NewPlayer, , NewPlayer.Location);

  if (MarbleLevelInfo != None) {
    `log("StartMatch: MarbleLevelInfo found!");
    TimeLeft = MarbleLevelInfo.AllottedTime;
  } else {
    `log("StartMatch: MarbleLevelInfo not found!");
    TimeLeft = DefaultTimeLeft;
  }

}

function Tick(float DeltaTime) {
  TimeLeft -= DeltaTime;
}

defaultproperties
{
  DefaultTimeLeft=42
  PlayerControllerClass=class'MarblePlayerController'
  HUDType=class'Marble.MarbleHUD'
  GameReplicationInfoClass=class'MarbleGameReplicationInfo'
}
