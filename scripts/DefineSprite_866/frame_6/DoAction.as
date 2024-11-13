attackbtn.tabEnabled = movebtn.tabEnabled = waitbtn.tabEnabled = statusbtn.tabEnabled = false;
if(_parent.currentunit.attacked)
{
   attackbtn.enabled = false;
   if(_parent.currentunit.moved)
   {
      movebtn.enabled = canundo;
   }
}
stop();
