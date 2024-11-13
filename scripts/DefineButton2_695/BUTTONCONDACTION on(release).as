on(release){
   var s = new Sound(this);
   s.attachSound("Beep1");
   s.start();
   _parent._parent._parent.cancelaction();
}
