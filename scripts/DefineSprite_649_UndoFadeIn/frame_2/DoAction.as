if(_parent._alpha >= 100)
{
   removeMovieClip(this);
}
else
{
   _parent.shadow._alpha = _parent._alpha += 25;
   gotoAndPlay(1);
}
