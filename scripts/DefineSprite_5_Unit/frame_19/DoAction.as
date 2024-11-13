state = "Attacking";
sprite.attacking = fxdone = counting = true;
sprite.connected = false;
if(attackface)
{
   targetdirection = (direction + 1) % 4 + 1;
   var i = 0;
   while(i < targetlist.length)
   {
      targetlist[i].stand(targetdirection);
      i++;
   }
}
targeti = 0;
switch(Math.abs(direction - olddirection))
{
   case 0:
      sprite.gotoAndPlay("Attack" + direction);
      gotoAndPlay(25);
      break;
   case 2:
      sprite.gotoAndStop("WalkM" + (olddirection % 4 + 1));
      break;
   default:
      gotoAndPlay(21);
}
