on(releaseOutside, rollOut){
   if(_parent._parent._parent.map[row][col] != -1)
   {
      _parent._parent._parent.pointer._visible = false;
      _parent._parent._parent.pointer.stop();
      _parent._parent._parent.targetstats.showstats();
   }
   _parent.bounds.removeMovieClip();
}
