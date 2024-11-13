on(rollOver){
   var tunit = _parent._parent._parent.map[row][col];
   if(tunit.unitcell != null)
   {
      var s = new Sound(this);
      s.attachSound("Beep1");
      s.start();
      _parent._parent._parent.pointer._x = _X;
      _parent._parent._parent.pointer._y = _Y;
      _parent._parent._parent.pointer.play();
      _parent._parent._parent.pointer._visible = true;
      var aunit = _parent._parent._parent.currentunit;
      var mindmg;
      var maxdmg;
      if(aunit.damage == "heal")
      {
         mindmg = aunit.ap * 50;
         maxdmg = mindmg + mindmg * aunit.ap / 300;
      }
      else
      {
         var tdf;
         if(aunit.damage == "magic")
         {
            tdf = tunit.mdf;
         }
         else
         {
            tdf = tunit.df;
         }
         maxdmg = mindmg = (aunit.ap - tdf) * 50;
         if(aunit.damage == "magic")
         {
            maxdmg += maxdmg * aunit.ap / 300;
            mindmg -= mindmg * tdf / 200;
         }
         else
         {
            maxdmg += maxdmg * aunit.ag / 100;
            mindmg -= mindmg * tunit.ag / 50;
         }
      }
      if(mindmg < 0)
      {
         mindmg = 0;
      }
      else if(mindmg > 9999)
      {
         mindmg = 9999;
      }
      if(maxdmg < 0)
      {
         maxdmg = 0;
      }
      else if(maxdmg > 9999)
      {
         maxdmg = 9999;
      }
      var vary;
      if(maxdmg != 0)
      {
         vary = Math.round(100 * mindmg / maxdmg);
      }
      else
      {
         vary = 0;
      }
      _parent._parent._parent.targetstats.showstats(tunit,Math.round(maxdmg),vary,aunit.damage == "heal");
   }
   _parent.attachMovie("Blank","bounds",10000);
   _parent.bounds._x = _parent.bounds._y = 0;
   if(_parent.attacktype == "normal")
   {
      var temprow = 0;
      while(temprow < len)
      {
         var tempcol = 0;
         while(tempcol < len)
         {
            if(bbuffer[temprow][tempcol])
            {
               var maprow = temprow + row - _parent.spread;
               var mapcol = tempcol + col - _parent.spread;
               if(bbuffer[temprow][tempcol] != null)
               {
                  var tempcell = "bound" + maprow + "x" + mapcol;
                  _parent.bounds.attachMovie("AttackBound",tempcell,100 * maprow + mapcol);
                  eval("_parent.bounds." + tempcell).row = maprow;
                  eval("_parent.bounds." + tempcell).col = mapcol;
                  eval("_parent.bounds." + tempcell).bounds = bbuffer[temprow][tempcol];
               }
            }
            tempcol++;
         }
         temprow++;
      }
   }
   else if(_parent.attacktype == "line" || _parent.attacktype == "projectile")
   {
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
         if(bbuffer[i] != null)
         {
            var tempcell = "bound" + temprow + "x" + tempcol;
            _parent.bounds.attachMovie("AttackBound",tempcell,100 * temprow + tempcol);
            eval("_parent.bounds." + tempcell).row = temprow;
            eval("_parent.bounds." + tempcell).col = tempcol;
            eval("_parent.bounds." + tempcell).bounds = bbuffer[i];
         }
         i++;
      }
   }
}
