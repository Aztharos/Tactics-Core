on(release){
   var facedirection;
   if(Math.abs(row - _parent.crow) < Math.abs(col - _parent.ccol))
   {
      if(col > _parent.ccol)
      {
         facedirection = 1;
      }
      else
      {
         facedirection = 3;
      }
   }
   else if(row > _parent.crow)
   {
      facedirection = 2;
   }
   else
   {
      facedirection = 4;
   }
   if(_parent.attacktype == "normal")
   {
      if(_parent.spread <= 0)
      {
         _parent._parent._parent.doattack(facedirection,row,col);
      }
      else
      {
         var area = new Array();
         var coords = new Object();
         coords.row = row;
         coords.col = col;
         area.push(coords);
         var i = 1;
         while(i <= _parent.spread)
         {
            var temprow;
            var tempcol;
            temprow = _parent.spread;
            tempcol = _parent.spread + i;
            while(tempcol > _parent.spread)
            {
               if(bbuffer[temprow][tempcol] != null)
               {
                  var coords = new Object();
                  coords.row = temprow + row - _parent.spread;
                  coords.col = tempcol + col - _parent.spread;
                  area.push(coords);
               }
               temprow++;
               tempcol--;
            }
            temprow = _parent.spread + i;
            tempcol = _parent.spread;
            while(temprow > _parent.spread)
            {
               if(bbuffer[temprow][tempcol] != null)
               {
                  var coords = new Object();
                  coords.row = temprow + row - _parent.spread;
                  coords.col = tempcol + col - _parent.spread;
                  area.push(coords);
               }
               temprow--;
               tempcol--;
            }
            temprow = _parent.spread;
            tempcol = _parent.spread - i;
            while(tempcol < _parent.spread)
            {
               if(bbuffer[temprow][tempcol] != null)
               {
                  var coords = new Object();
                  coords.row = temprow + row - _parent.spread;
                  coords.col = tempcol + col - _parent.spread;
                  area.push(coords);
               }
               temprow--;
               tempcol++;
            }
            temprow = _parent.spread - i;
            tempcol = _parent.spread;
            while(temprow < _parent.spread)
            {
               if(bbuffer[temprow][tempcol] != null)
               {
                  var coords = new Object();
                  coords.row = temprow + row - _parent.spread;
                  coords.col = tempcol + col - _parent.spread;
                  area.push(coords);
               }
               temprow++;
               tempcol++;
            }
            i++;
         }
         _parent._parent._parent.doattack(facedirection,null,null,area);
      }
   }
   else if(_parent.attacktype == "line")
   {
      var temprow = _parent.crow;
      var tempcol = _parent.ccol;
      var area = new Array();
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
         if(bbuffer[i] != null)
         {
            var coords = new Object();
            coords.row = temprow;
            coords.col = tempcol;
            area.push(coords);
         }
         i++;
      }
      _parent._parent._parent.doattack(facedirection,null,null,area);
   }
   else if(_parent.attacktype == "projectile")
   {
      var temprow = _parent.crow;
      var tempcol = _parent.ccol;
      if(col > _parent.ccol)
      {
         tempcol += _parent.range;
      }
      else if(row > _parent.crow)
      {
         temprow += _parent.range;
      }
      else if(col < _parent.ccol)
      {
         tempcol -= _parent.range;
      }
      else if(row < _parent.crow)
      {
         temprow -= _parent.range;
      }
      var i = _parent.range;
      while(bbuffer[--i] == null)
      {
         if(col > _parent.ccol)
         {
            tempcol--;
         }
         else if(row > _parent.crow)
         {
            temprow--;
         }
         else if(col < _parent.ccol)
         {
            tempcol++;
         }
         else if(row < _parent.crow)
         {
            temprow++;
         }
      }
      _parent._parent._parent.doattack(facedirection,temprow,tempcol);
   }
}
