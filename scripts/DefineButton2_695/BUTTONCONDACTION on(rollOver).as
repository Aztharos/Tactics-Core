on(rollOver){
   var s = new Sound(this);
   s.attachSound("Beep1");
   s.start();
   _parent._parent._parent.canceltext._x = _X;
   _parent._parent._parent.canceltext._y = _Y;
   _parent._parent._parent.canceltext._visible = true;
}
