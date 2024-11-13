_X = _Y = 0;
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
glowr = 0;
glowg = 0;
glowb = 255;
_parent._x += 3 * DX;
_parent._y += 3 * DY;
_X = _X - 3 * DX;
_Y = _Y - 3 * DY;
