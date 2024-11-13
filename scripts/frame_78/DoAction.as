stop();
allystats._visible = queue._visible = activestats._visible = targetstats._visible = true;
if(muted != true)
{
   Mute.gotoAndStop("UnMuted");
}
else
{
   Mute.gotoAndStop("Muted");
}
beginnextturn();
