on(rollOver){
   var s = new Sound(this);
   s.attachSound("Beep1");
   s.start();
   btn.useHandCursor = _parent._parent.movecells == null && _parent._parent.attackcells == null;
   _parent._parent._parent.pointer._x = _X;
   _parent._parent._parent.pointer._y = _Y;
   _parent._parent._parent.pointer.play();
   _parent._parent._parent.pointer._visible = true;
   _parent._parent._parent.targetstats.showstats(unit);
}
