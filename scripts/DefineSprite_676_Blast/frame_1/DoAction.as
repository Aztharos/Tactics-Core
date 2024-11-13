_X = 0;
_Y = -30;
switch(direction)
{
   case 1:
      DX = 4;
      DY = 2;
      break;
   case 2:
      DX = - 4;
      DY = 2;
      break;
   case 3:
      DX = - 4;
      DY = - 2;
      break;
   case 4:
      DX = 4;
      DY = - 2;
      break;
   default:
      DX = DY = 0;
}
spritecolor = new Color(_parent);
glow = new Object();
glow = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
glowr = 102;
glowg = 153;
glowb = 255;
glow.rb = glowr / 3;
glow.gb = glowg / 3;
glow.bb = glowb / 3;
spritecolor.setTransform(glow);
