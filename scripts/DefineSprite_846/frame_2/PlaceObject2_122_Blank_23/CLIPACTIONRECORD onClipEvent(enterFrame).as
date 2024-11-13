onClipEvent(enterFrame){
   if(_parent.myhp != _parent.newhp)
   {
      count += 0.045;
      _parent.myhp += Math.round((_parent.newhp - _parent.myhp) * count);
      if(_parent.myhp > _parent.newhp)
      {
         _parent.myhp--;
      }
      else if(_parent.myhp < _parent.newhp)
      {
         _parent.myhp = _parent.myhp + 1;
      }
      if(_parent.hp != "????")
      {
         _parent.hp = _parent.myhp;
         _parent.hpmax = _parent.myhpmax;
      }
      _parent.hpbar.gotoAndStop(1 + Math.round(199 * _parent.myhp / _parent.myhpmax));
   }
   else
   {
      _parent.gotoAndStop(1);
   }
}
