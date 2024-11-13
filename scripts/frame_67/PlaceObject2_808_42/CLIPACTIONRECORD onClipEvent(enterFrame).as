onClipEvent(enterFrame){
   var l = _parent.getBytesLoaded();
   var t = _parent.getBytesTotal();
   if(l >= t)
   {
      gotoAndStop(503);
   }
   else
   {
      gotoAndStop(2 + Math.round(500 * l / t));
   }
}
