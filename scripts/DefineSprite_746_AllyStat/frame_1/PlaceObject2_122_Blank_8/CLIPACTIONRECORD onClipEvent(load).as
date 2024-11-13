onClipEvent(load){
   count = 0.2;
   hp = _parent.unit.hp;
   _parent.gotoAndStop(150 - Math.round(149 * hp / _parent.unit.hpmax));
}
