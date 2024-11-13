sprite.gotoAndStop("WalkM" + direction);
moveshift();
if(path.length <= 0)
{
   _parent._parent.map[row][col] = this;
   moved = true;
   _parent._parent.endaction();
   stand();
}
