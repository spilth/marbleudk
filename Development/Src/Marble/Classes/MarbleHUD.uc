class MarbleHUD extends HUD;

simulated event PostRender() {
  super.PostRender();

  Canvas.SetPos(Canvas.ClipX/2,Canvas.ClipY/8);
  Canvas.SetDrawColor(255,255,255,255);
  Canvas.Font = class'Engine'.static.GetLargeFont();
  Canvas.DrawText(""$int(MarbleGameInfo(WorldInfo.Game).TimeLeft));
}

defaultproperties
{

}