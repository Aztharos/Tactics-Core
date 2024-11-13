onClipEvent(enterFrame){
   if(_parent._parent.currentunit.attacked && _parent.attackbtn._alpha > 50)
   {
      _parent.attackbtn._alpha -= 10;
   }
}
