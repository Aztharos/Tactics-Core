_X = _parent._parent._parent._parent.cell_x(row,col);
_Y = _parent._parent._parent._parent.cell_y(row,col);
var i = 1;
while(i <= 4)
{
   if(bounds.indexOf("" + i) < 0)
   {
      eval("b" + i)._visible = false;
   }
   i++;
}
