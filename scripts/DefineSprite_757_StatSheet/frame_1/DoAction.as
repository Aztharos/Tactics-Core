function showbar(bar, percentage)
{
   if(percentage < 0)
   {
      percentage = 0;
   }
   else if(percentage > 1)
   {
      percentage = 1;
   }
   bar.gotoAndStop(1 + Math.round(199 * percentage));
}
var unit = _parent._parent.currentunit;
name = unit.name;
if(unit.attacktype == "projectile")
{
   ability = "Long range ";
}
else if(unit.range > 1)
{
   if(unit.attacktype == "line")
   {
      ability = "In line ";
   }
   else if(unit.spread > 0)
   {
      ability = "Area ";
   }
   else
   {
      ability = "Ranged ";
   }
}
else
{
   ability = "Close range ";
}
if(unit.damage == "heal")
{
   ability += "heal";
}
else if(unit.damage == "magic")
{
   ability += "magic damage";
}
else
{
   ability += "physical damage";
}
showbar(power,unit.ap / 30);
showbar(vitality,Math.pow(unit.hpmax / 5000,0.8));
showbar(agility,unit.ag / 20);
showbar(defense,unit.df / 20);
showbar(magicresist,unit.mdf / 20);
showbar(speed,Math.pow((unit.spd - 4) / 16,1.2));
showbar(movement,Math.pow(unit.movedistance / 6,1.2));
_X = -800;
_Y = -600;
