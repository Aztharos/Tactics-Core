state = "Walking";
sprite.gotoAndStop("WalkL" + direction);
moveshift();
if(_parent._parent.map[row][col] != -1)
{
   var temp;
   if(path.length > 0)
   {
      temp = Number(path.charAt(0));
   }
   else
   {
      temp = 0;
   }
   _parent._parent.map[row][col].letpass(direction,temp);
}
