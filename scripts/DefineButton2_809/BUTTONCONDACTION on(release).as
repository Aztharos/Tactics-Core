on(release){
   if(cells.moverangecells != null)
   {
      cells.moverangecells.removeMovieClip();
   }
   else if(cells.movecells != null || cells.attackcells != null)
   {
      cancelaction();
   }
   else if(activestats.statsheet != null)
   {
      activestats.statsheet.removeMovieClip();
      menu.gotoAndPlay("ShowMenu");
   }
}
