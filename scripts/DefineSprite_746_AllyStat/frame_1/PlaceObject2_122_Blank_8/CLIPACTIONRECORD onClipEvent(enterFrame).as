onClipEvent(enterFrame){
   if(_parent.unit.unitcell == null)
   {
      newhp = 0;
   }
   else
   {
      newhp = _parent.unit.hp;
   }
   if(hp != newhp)
   {
      count += 0.045;
      hp += Math.round((newhp - hp) * count);
      if(hp > newhp)
      {
         hp--;
      }
      else if(hp < newhp)
      {
         hp++;
      }
      if(hp <= 0)
      {
         _parent.gotoAndPlay(150);
      }
      else
      {
         _parent.gotoAndStop(150 - Math.round(149 * hp / _parent.unit.hpmax));
      }
   }
   else
   {
      count = 0.2;
   }
}
