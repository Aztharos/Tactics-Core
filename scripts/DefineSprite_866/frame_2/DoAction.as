_parent.indicator._x = _X = _parent.currentunit._x;
_parent.indicator._y = _parent.currentunit._y + 22;
_Y = _parent.currentunit._y - 25;
_parent.indicator.play();
_parent.indicator._visible = true;
command = "";
if(_parent.currentunit.damage == "heal")
{
   actstring = "Heal";
}
else
{
   actstring = "Attack";
}
if(_parent.currentunit.moved)
{
   movestring = "Undo";
}
else
{
   movestring = "Move";
}
if(!_parent.currentunit.attacked)
{
   canundo = true;
}
if(!_parent.currentunit.moved && !_parent.currentunit.attacked)
{
   halfcnt = _parent.currentunit.cnt / 2;
}
else
{
   halfcnt = null;
}
_parent.showcells();
_parent.items.gotoAndStop("Enable");
