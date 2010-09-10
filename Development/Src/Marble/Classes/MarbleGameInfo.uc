class MarbleGameInfo extends GameInfo;

event PostLogin(PlayerController NewPlayer) {
	super.PostLogin(NewPlayer);

	MarblePlayerController(NewPlayer).Marble = Spawn(class'MarbleActor', NewPlayer, , NewPlayer.Location);
}

defaultproperties
{
	PlayerControllerClass=class'MarblePlayerController'

}