glow.rb = glow.gb = glow.bb = 0;
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
