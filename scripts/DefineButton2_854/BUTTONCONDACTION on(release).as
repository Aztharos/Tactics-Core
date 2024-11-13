on(release){
   _parent.hidecells();
   _parent.items.gotoAndStop("Disable");
   if(_parent.cells.moverangecells != null)
   {
      _parent.cells.moverangecells.removeMovieClip();
   }
   if(halfcnt != null)
   {
      _parent.currentunit.cnt = halfcnt;
   }
   docommand = "Wait";
   gotoAndPlay(_currentframe + 2);
}
