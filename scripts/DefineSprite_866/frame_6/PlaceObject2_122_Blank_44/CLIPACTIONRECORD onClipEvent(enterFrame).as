onClipEvent(enterFrame){
   if(_parent._parent.currentunit.moved)
   {
      if(!_parent.canundo && _parent.movebtn._alpha > 50)
      {
         _parent.movebtn._alpha -= 10;
      }
      switch(_parent.movebtn._rotation)
      {
         case 0:
            _parent.movebtn._rotation = - 16.2;
            break;
         case - 16.2:
            _parent.movebtn._rotation = - 28.8;
            break;
         case - 28.8:
            _parent.movebtn._rotation = - 37.8;
            break;
         case - 37.8:
            _parent.movebtn._rotation = - 43.2;
            break;
         case - 43.2:
            _parent.movebtn._rotation = - 45;
      }
   }
}
