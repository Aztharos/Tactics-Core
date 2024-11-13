stop();
if(docommand == "Attack")
{
   if(_parent.currentunit.moved)
   {
      canundo = false;
   }
   _parent.currentunit.attackcommand();
}
else if(docommand == "Move")
{
   _parent.currentunit.movecommand();
}
else if(docommand == "Wait")
{
   _parent.endturn();
}
else if(docommand == "Status")
{
   _parent.activestats.attachMovie("StatSheet","statsheet",10);
}
