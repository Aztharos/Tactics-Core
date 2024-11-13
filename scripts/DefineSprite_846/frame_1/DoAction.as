function showstats(unit, damage, vary, heal)
{
   if(unit == null)
   {
      name = "";
      hp = hpmax = "----";
      negdmg = posdmg = negvary = posvary = "";
      pic.gotoAndStop(1);
      hpbar.gotoAndStop(1);
   }
   else
   {
      name = unit.name;
      myhp = unit.hp;
      myhpmax = unit.hpmax;
      if(unit.hpsecret == true)
      {
         hp = hpmax = "????";
      }
      else
      {
         hp = myhp;
         hpmax = myhpmax;
      }
      pic.gotoAndStop(unit.unit);
      hpbar.gotoAndStop(1 + Math.round(199 * myhp / myhpmax));
      if(damage == null)
      {
         negdmg = posdmg = negvary = posvary = "";
      }
      else if(heal)
      {
         negdmg = negvary = "";
         posdmg = "+" + damage;
         posvary = "(" + vary + "%)";
      }
      else
      {
         posdmg = posvary = "";
         negdmg = "-" + damage;
         negvary = "(" + vary + "%)";
      }
   }
}
hpbar.stop();
if(_name == "activestats")
{
   gotoAndStop(3);
}
else
{
   stop();
}
