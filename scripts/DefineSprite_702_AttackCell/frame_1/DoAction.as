btn.tabEnabled = false;
_X = _parent._parent._parent.cell_x(row,col);
_Y = _parent._parent._parent.cell_y(row,col);
if(_parent.attacktype == "normal")
{
   len = _parent.spread * 2 + 1;
   bbuffer = new Array(len);
   var i = 0;
   while(i < len)
   {
      bbuffer[i] = new Array(len);
      i++;
   }
   var temprow = row - _parent.spread;
   while(temprow <= row + _parent.spread)
   {
      var spread1 = _parent.spread - Math.abs(row - temprow);
      var tempcol = col - spread1;
      while(tempcol <= col + spread1)
      {
         if(_parent.crow != temprow || _parent.ccol != tempcol)
         {
            if(_parent._parent._parent.map[temprow][tempcol] != null && _parent._parent._parent.map[temprow][tempcol] != -2)
            {
               bbuffer[temprow - row + _parent.spread][tempcol - col + _parent.spread] = true;
            }
         }
         tempcol++;
      }
      temprow++;
   }
   var temprow = 0;
   while(temprow < len)
   {
      var tempcol = 0;
      while(tempcol < len)
      {
         if(bbuffer[temprow][tempcol])
         {
            bounds = "";
            if(bbuffer[temprow][tempcol + 1] == null)
            {
               bounds += "1";
            }
            if(bbuffer[temprow + 1][tempcol] == null)
            {
               bounds += "2";
            }
            if(bbuffer[temprow][tempcol - 1] == null)
            {
               bounds += "3";
            }
            if(bbuffer[temprow - 1][tempcol] == null)
            {
               bounds += "4";
            }
            bbuffer[temprow][tempcol] = bounds;
         }
         tempcol++;
      }
      temprow++;
   }
}
else if(_parent.attacktype == "line" || _parent.attacktype == "projectile")
{
   bbuffer = new Array(_parent.range);
   temprow = _parent.crow;
   tempcol = _parent.ccol;
   var i = 0;
   while(i < _parent.range)
   {
      if(col > _parent.ccol)
      {
         tempcol++;
      }
      else if(row > _parent.crow)
      {
         temprow++;
      }
      else if(col < _parent.ccol)
      {
         tempcol--;
      }
      else if(row < _parent.crow)
      {
         temprow--;
      }
      if(eval("_parent.cell" + temprow + "x" + tempcol) != null)
      {
         bbuffer[i] = true;
      }
      i++;
   }
   var i = 0;
   while(i < _parent.range)
   {
      if(bbuffer[i])
      {
         bounds = "";
         if(col > _parent.ccol)
         {
            if(bbuffer[i + 1] == null)
            {
               bounds += "1";
            }
            bounds += "2";
            if(bbuffer[i - 1] == null)
            {
               bounds += "3";
            }
            bounds += "4";
         }
         else if(row > _parent.crow)
         {
            bounds += "1";
            if(bbuffer[i + 1] == null)
            {
               bounds += "2";
            }
            bounds += "3";
            if(bbuffer[i - 1] == null)
            {
               bounds += "4";
            }
         }
         else if(col < _parent.ccol)
         {
            if(bbuffer[i - 1] == null)
            {
               bounds += "1";
            }
            bounds += "2";
            if(bbuffer[i + 1] == null)
            {
               bounds += "3";
            }
            bounds += "4";
         }
         else if(row < _parent.crow)
         {
            bounds += "1";
            if(bbuffer[i - 1] == null)
            {
               bounds += "2";
            }
            bounds += "3";
            if(bbuffer[i + 1] == null)
            {
               bounds += "4";
            }
         }
         bbuffer[i] = bounds;
      }
      i++;
   }
}
