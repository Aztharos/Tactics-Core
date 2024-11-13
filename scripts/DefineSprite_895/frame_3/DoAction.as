stop();
if(!moved)
{
   move();
}
else if(!attacked)
{
   attack();
}
else
{
   if(!_parent.currentunit.moved && !_parent.currentunit.attacked)
   {
      _parent.currentunit.cnt /= 2;
   }
   _parent.endturn();
}
