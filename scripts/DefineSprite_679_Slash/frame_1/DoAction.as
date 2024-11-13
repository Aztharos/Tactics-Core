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
