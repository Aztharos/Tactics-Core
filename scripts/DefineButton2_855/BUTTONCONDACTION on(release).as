on(release){
   _parent.hidecells();
   _parent.items.gotoAndStop("Disable");
   if(_parent.cells.moverangecells != null)
   {
      _parent.cells.moverangecells.removeMovieClip();
   }
   docommand = movestring;
   if(docommand == "Undo")
   {
      _parent.currentunit.undocommand();
   }
   gotoAndPlay(_currentframe + 2);
}
