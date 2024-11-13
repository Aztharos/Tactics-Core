_X = 0;
_Y = -34;
switch(direction)
{
   case 1:
      _X = _X - 5;
      _Y = _Y + 2.5;
      DX = 4;
      DY = 2;
      break;
   case 2:
      _X = _X - 5;
      _Y = _Y - 2.5;
      DX = - 4;
      DY = 2;
      break;
   case 3:
      _X = _X + 5;
      _Y = _Y - 2.5;
      DX = - 4;
      DY = - 2;
      break;
   case 4:
      _X = _X + 5;
      _Y = _Y + 2.5;
      DX = 4;
      DY = - 2;
      break;
   default:
      DX = DY = 0;
}
_parent._x += 3 * DX;
_parent._y += 3 * DY;
_parent._parent.shadow._x += 3 * DX;
_parent._parent.shadow._y += 3 * DY;
