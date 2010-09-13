class MarbleHUD extends HUD;

simulated event PostRender() {
  super.PostRender();

  Canvas.SetPos(Canvas.ClipX/2,Canvas.ClipY/8);
  Canvas.SetDrawColor(255,255,255,255);
  Canvas.Font = class'Engine'.static.GetMediumFont();
  Canvas.DrawText("60");
}

defaultproperties
{

}