function doglow()
{
   x += y;
   if(x > 100)
   {
      y *= -1;
      x += y;
   }
   else if(x < 0)
   {
      x = 0;
   }
   glow.rb = 112 * x / 100;
   glow.gb = 255 * x / 100;
   glow.bb = 204 * x / 100;
   spritecolor.setTransform(glow);
}
_X = 0;
_Y = -27.5;
spritecolor = new Color(_parent);
glow = new Object();
glow = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
x = 0;
y = 14.285714285714286;
