sprite.gotoAndStop("WalkM" + direction);
moveshift();
if(_parent._parent.map[row][col] != -1)
{
   var tempdir = _parent._parent.map[row][col].dodgedirection;
   if(tempdir < 3)
   {
      setdepth(1);
   }
   else
   {
      setdepth(-1);
   }
}
else
{
   setdepth();
}
