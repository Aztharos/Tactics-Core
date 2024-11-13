var vol = bgm.getVolume();
if(vol <= 5)
{
   bgm.stop();
   stop();
}
else
{
   bgm.setVolume(vol - 5);
}
