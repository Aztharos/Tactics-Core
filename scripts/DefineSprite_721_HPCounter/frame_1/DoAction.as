done = false;
_Y = 0;
if(heal)
{
   green = new Object();
   green = {ra:"20",rb:"0",ga:"100",gb:"0",ba:"40",bb:"0",aa:"100",ab:"0"};
   new Color(this).setTransform(green);
}
thousands = Math.floor(counter / 1000);
counter -= thousands * 1000;
hundreds = Math.floor(counter / 100);
counter -= hundreds * 100;
tens = Math.floor(counter / 10);
ones = counter - tens * 10;
if(thousands > 0)
{
   _X = 0;
   d4.digit.digit = thousands;
}
else
{
   thousands = "";
   if(hundreds > 0)
   {
      _X = -5.15;
   }
   else
   {
      hundreds = "";
      if(tens > 0)
      {
         _X = -10.3;
      }
      else
      {
         tens = "";
         _X = -15.45;
      }
   }
}
