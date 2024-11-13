on(release){
   _parent.hidecells();
   _parent.items.gotoAndStop("Disable");
   if(_parent.cells.moverangecells != null)
   {
      _parent.cells.moverangecells.removeMovieClip();
   }
   docommand = "Status";
   gotoAndPlay(_currentframe + 2);
}
