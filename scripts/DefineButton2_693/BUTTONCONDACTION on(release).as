on(release){
   if(_parent._parent.movecells == null && _parent._parent.attackcells == null)
   {
      var s = new Sound(this);
      s.attachSound("Beep1");
      s.start();
      unit.showmoverange();
   }
}
