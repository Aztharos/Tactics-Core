_parent._x -= 2 * DX;
_parent._y -= 2 * DY;
_parent._parent.stand();
glow.rb = 0;
glow.gb = 0;
glow.bb = 0;
spritecolor.setTransform(glow);
delete glow;
delete spritecolor;
if(_parent.istempfx)
{
   _parent.removeMovieClip();
}
else
{
   removeMovieClip(this);
}
