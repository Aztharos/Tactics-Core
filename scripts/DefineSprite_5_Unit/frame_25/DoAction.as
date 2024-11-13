if(sprite.attacking || sprite.connected)
{
   shadow._x = _X + sprite.shift_x;
   shadow._y = _Y + sprite.shift_y;
   if(sprite.connected)
   {
      if(targetlist[targeti] != null)
      {
         targetlist[targeti].sprite.attachMovie(sprite.fxtype,"fx",100);
         targetlist[targeti].sprite.fx.direction = direction;
         if(attackbump != false)
         {
            if(targetlist[targeti] != this)
            {
               targetlist[targeti].sprite.gotoAndStop("WalkR" + targetlist[targeti].direction);
            }
            targetlist[targeti].sprite._x += sprite.bump_x;
            targetlist[targeti].sprite._y += sprite.bump_y;
            targetlist[targeti].shadow._x += sprite.bump_x;
            targetlist[targeti].shadow._y += sprite.bump_y;
            if(targetlist[targeti].bloodtype != undefined)
            {
               var bloodname = "blood" + targetlist[targeti].row + "x" + targetlist[targeti].col + "x";
            }
            var i = 0;
            while(i < 2)
            {
               var bloodname1 = bloodname + _parent._parent.bloods[targetlist[targeti].row][targetlist[targeti].col]++;
               _parent._parent.blood.attachMovie(targetlist[targeti].bloodtype,bloodname1,_parent._parent.bloodcount++);
               eval("_parent._parent.blood." + bloodname + (_parent._parent.bloods[targetlist[targeti].row][targetlist[targeti].col] - 25)).removeMovieClip();
               var tempblood = eval("_parent._parent.blood." + bloodname1);
               tempblood._x = Math.random() * 50 - 25 + _parent._parent.cell_x(targetlist[targeti].row,targetlist[targeti].col);
               tempblood._y = Math.random() * 25 + 9.5 + _parent._parent.cell_y(targetlist[targeti].row,targetlist[targeti].col);
               tempblood._xscale = tempblood._yscale = 60 + Math.random() * 60;
               i++;
            }
         }
      }
      if(++targeti >= targetlist.length)
      {
         sprite.connected = false;
      }
   }
}
else if(fxdone)
{
   shadow._x = _X;
   shadow._y = _Y;
   var i = 0;
   while(i < targetlist.length)
   {
      if(targetlist[i] != null && !targetlist[i].istempfx && attackbump != false)
      {
         targetlist[i].sprite._x -= sprite.bump_x;
         targetlist[i].sprite._y -= sprite.bump_y;
         targetlist[i].shadow._x -= sprite.bump_x;
         targetlist[i].shadow._y -= sprite.bump_y;
         if(attackrecover != false && targetlist[targeti] != this)
         {
            targetlist[i].stand();
         }
      }
      i++;
   }
   sprite.gotoAndStop("Stand" + direction);
   targeti = -1;
   lastcounter = counter = null;
   fxdone = false;
   killed = false;
}
else if(counting)
{
   if(counter == null || counter.done)
   {
      if(++targeti >= targetlist.length)
      {
         counting = false;
      }
      else if(targetlist[targeti].hp != undefined)
      {
         _parent._parent.targetstats.showstats(targetlist[targeti]);
         targetlist[targeti].attachMovie("HPCounter","hpcounter",110);
         lastcounter = counter = targetlist[targeti].hpcounter;
         var dmg;
         if(damage == "heal")
         {
            dmg = ap * 50;
            dmg += dmg * ap * Math.random() / 300;
         }
         else
         {
            var tdf;
            if(damage == "magic")
            {
               tdf = targetlist[targeti].mdf;
            }
            else
            {
               tdf = targetlist[targeti].df;
            }
            dmg = (ap - tdf) * 50;
            if(damage == "magic")
            {
               dmg += dmg * ap * Math.random() / 300;
               dmg -= dmg * tdf * Math.random() / 200;
            }
            else
            {
               dmg += dmg * ag * Math.random() / 100;
               dmg -= dmg * targetlist[targeti].ag * Math.random() / 50;
            }
         }
         if(dmg < 0)
         {
            dmg = 0;
         }
         else if(dmg > 9999)
         {
            dmg = 9999;
         }
         else
         {
            dmg = Math.round(dmg);
         }
         counter.heal = damage == "heal";
         if(counter.heal)
         {
            targetlist[targeti].hp += dmg;
            if(targetlist[targeti].hp > targetlist[targeti].hpmax)
            {
               dmg -= targetlist[targeti].hp - targetlist[targeti].hpmax;
               targetlist[targeti].hp = targetlist[targeti].hpmax;
            }
         }
         else
         {
            targetlist[targeti].hp -= dmg;
            if(targetlist[targeti].hp <= 0)
            {
               targetlist[targeti].hp = 0;
               killed = true;
               targetlist[targeti].die();
            }
         }
         counter.counter = dmg;
         _parent._parent.targetstats.newhp = targetlist[targeti].hp;
         _parent._parent.targetstats.gotoAndStop("HPChange");
      }
      else
      {
         counter = null;
      }
   }
}
else if(lastcounter.done == undefined)
{
   delete targetlist;
   attacked = true;
   if(killed)
   {
      _parent._parent.calcqueue();
      _parent._parent.showqueue();
   }
   _parent._parent.endaction();
   undodirection = direction;
   stand();
}
