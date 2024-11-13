_parent._x += DX / 2;
_parent._y += DY / 2;
_parent._parent.stand();
if(_parent.istempfx)
{
   _parent.removeMovieClip();
}
else
{
   removeMovieClip(this);
}
