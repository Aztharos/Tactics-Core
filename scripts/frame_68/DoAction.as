function cell_x(row, col)
{
   return 400 + (col - row) * 44;
}
function cell_y(row, col)
{
   return (col + row) * 22 - 206;
}
function hidecells()
{
   cells._visible = false;
   pointer._visible = false;
   pointer.stop();
}
function showcells()
{
   cells._visible = true;
}
function cancelaction()
{
   canceltext._visible = false;
   if(cells.movecells != null)
   {
      cells.movecells.removeMovieClip();
   }
   if(cells.attackcells != null)
   {
      cells.attackcells.removeMovieClip();
   }
   menu.gotoAndPlay("ShowMenu");
}
function endaction()
{
   targetstats.showstats();
   var count = 0;
   var i = 0;
   while(i < NUM_UNITS)
   {
      if(unit[i].control && unit[i].team == PLAYER && unit[i].unitcell != null)
      {
         count++;
         break;
      }
      i++;
   }
   if(count == 0)
   {
      gotoAndPlay(116);
   }
   else
   {
      count = 0;
      var i = 0;
      while(i < NUM_UNITS)
      {
         if(unit[i].team == ENEMY && unit[i].unitcell != null)
         {
            count++;
         }
         i++;
      }
      if(count == 0)
      {
         gotoAndPlay(79);
      }
      else if(unit[1].unitcell == null && unit[2].unitcell == null && unit[3].unitcell == null && unit[4].unitcell == null && unit[5].unitcell == null && unit[6].unitcell == null && unit[0].unit == "Healer")
      {
         allystats._visible = queue._visible = activestats._visible = targetstats._visible = false;
         unit[0].attachMovie("Transform","fx",99);
      }
      else if(currentunit.control)
      {
         menu.gotoAndPlay("ShowMenu");
      }
      else
      {
         ai.endact();
      }
   }
}
function doattack(direction, row, col, area)
{
   hidecells();
   targetstats.posdmg = targetstats.negdmg = targetstats.posvary = targetstats.negvary = "";
   indicator._visible = false;
   indicator.stop();
   cells.attackcells.removeMovieClip();
   currentunit.attack(direction,row,col,area);
}
function domove(row, col)
{
   hidecells();
   indicator._visible = false;
   indicator.stop();
   cells.movecells.removeMovieClip();
   dbuffer = new Array(ROWS);
   var i = 0;
   while(i < ROWS)
   {
      dbuffer[i] = new Array(COLS);
      i++;
   }
   currentunit.movepath(getmovepath(currentunit.row,currentunit.col,row,col,currentunit.movedistance,0));
   delete dbuffer;
}
function getmovepath(row1, col1, row2, col2, maxsteps, steps)
{
   if(steps >= maxsteps)
   {
      return false;
   }
   if(dbuffer[row1][col1] != undefined && dbuffer[row1][col1] <= steps)
   {
      return false;
   }
   dbuffer[row1][col1] = steps;
   if(row1 == row2 && col1 + 1 == col2)
   {
      return "1";
   }
   if(row1 + 1 == row2 && col1 == col2)
   {
      return "2";
   }
   if(row1 == row2 && col1 - 1 == col2)
   {
      return "3";
   }
   if(row1 - 1 == row2 && col1 == col2)
   {
      return "4";
   }
   var temp1;
   var temp2;
   var tempd = "";
   if(map[row1][col1 + 1] != -1 && map[row1][col1 + 1].team != currentunit.team)
   {
      temp1 = false;
   }
   else
   {
      temp1 = getmovepath(row1,col1 + 1,row2,col2,maxsteps,steps + 1);
      if(temp1 != false)
      {
         tempd = "1";
      }
   }
   if(map[row1 + 1][col1] == -1 || map[row1 + 1][col1].team == currentunit.team)
   {
      temp2 = getmovepath(row1 + 1,col1,row2,col2,maxsteps,steps + 1);
      if(temp2 != false)
      {
         if(temp1 == false)
         {
            tempd = "2";
            temp1 = temp2;
         }
         else if(temp2.length < temp1.length)
         {
            tempd = "2";
            temp1 = temp2;
         }
      }
   }
   if(map[row1][col1 - 1] == -1 || map[row1][col1 - 1].team == currentunit.team)
   {
      temp2 = getmovepath(row1,col1 - 1,row2,col2,maxsteps,steps + 1);
      if(temp2 != false)
      {
         if(temp1 == false)
         {
            tempd = "3";
            temp1 = temp2;
         }
         else if(temp2.length < temp1.length)
         {
            tempd = "3";
            temp1 = temp2;
         }
      }
   }
   if(map[row1 - 1][col1] == -1 || map[row1 - 1][col1].team == currentunit.team)
   {
      temp2 = getmovepath(row1 - 1,col1,row2,col2,maxsteps,steps + 1);
      if(temp2 != false)
      {
         if(temp1 == false)
         {
            tempd = "4";
            temp1 = temp2;
         }
         else if(temp2.length < temp1.length)
         {
            tempd = "4";
            temp1 = temp2;
         }
      }
   }
   if(!temp1)
   {
      return false;
   }
   return tempd + temp1;
}
function endturn()
{
   indicator._visible = false;
   indicator.stop();
   currentunit.unitcell.gotoAndStop("Enable");
   beginnextturn();
}
function beginnextturn()
{
   var mincnt = 99999;
   var i = 0;
   while(i < unit.length)
   {
      if(unit[i].unitcell != null)
      {
         if(unit[i].cnt < mincnt)
         {
            mincnt = unit[i].cnt;
         }
      }
      i++;
   }
   if(mincnt == 99999)
   {
      var i = 0;
      while(i < QSIZE)
      {
         eval("queue.q" + i).showpic();
         i++;
      }
      activestats.showstats();
      return undefined;
   }
   var currentcntoff = -1;
   var i = 0;
   while(i < unit.length)
   {
      if(unit[i].unitcell != null)
      {
         unit[i].cnt -= mincnt;
         if(unit[i].cnt <= 0 && unit[i].cntoff > currentcntoff)
         {
            currentcntoff = unit[i].cntoff;
            currentindex = i;
         }
      }
      i++;
   }
   currentunit = unit[currentindex];
   currentunit.cnt = 100 / currentunit.spd;
   currentunit.unitcell.gotoAndStop("Disable");
   queue.q0.showpic(currentunit.unit);
   calcqueue();
   calcqueue(true);
   showqueue();
   activestats.showstats(currentunit);
   currentunit.moved = currentunit.attacked = false;
   if(currentunit.control)
   {
      currentunit.undorow = currentunit.row;
      currentunit.undocol = currentunit.col;
      currentunit.undodirection = currentunit.direction;
      menu.gotoAndPlay("ShowMenu");
   }
   else
   {
      ai.act();
   }
}
function calcqueue(wait)
{
   var Qtemp;
   var fullcnt;
   if(wait == true)
   {
      fullcnt = currentunit.cnt;
      currentunit.cnt /= 2;
      Qtemp = Qhalf;
   }
   else
   {
      Qtemp = Qfull;
   }
   var j = 1;
   while(j < QSIZE)
   {
      Qtemp[j].cnt = 99999;
      j++;
   }
   var i = 0;
   while(i < unit.length)
   {
      if(unit[i].unitcell != null)
      {
         var j = 1;
         while(j < QSIZE)
         {
            if(unit[i].cnt < Qtemp[j].cnt || unit[i].cnt == Qtemp[j].cnt && unit[i].cntoff > Qtemp[j].cntoff)
            {
               var k = QSIZE - 1;
               while(k > j)
               {
                  var l = k - 1;
                  Qtemp[k].cnt = Qtemp[l].cnt;
                  Qtemp[k].cntoff = Qtemp[l].cntoff;
                  Qtemp[k].interval = Qtemp[l].interval;
                  Qtemp[k].unit = Qtemp[l].unit;
                  k--;
               }
               Qtemp[j].cnt = unit[i].cnt;
               Qtemp[j].cntoff = unit[i].cntoff;
               Qtemp[j].interval = 100 / unit[i].spd;
               Qtemp[j].unit = unit[i].unit;
               break;
            }
            j++;
         }
      }
      i++;
   }
   var i = 1;
   while(i < QSIZE - 1)
   {
      var nextcnt = Qtemp[i].cnt + Qtemp[i].interval;
      var j = i + 1;
      while(j < QSIZE)
      {
         if(nextcnt < Qtemp[j].cnt || nextcnt == Qtemp[j].cnt && Qtemp[i].cntoff > Qtemp[j].cntoff)
         {
            var k = QSIZE - 1;
            while(k > j)
            {
               var l = k - 1;
               Qtemp[k].cnt = Qtemp[l].cnt;
               Qtemp[k].cntoff = Qtemp[l].cntoff;
               Qtemp[k].interval = Qtemp[l].interval;
               Qtemp[k].unit = Qtemp[l].unit;
               k--;
            }
            Qtemp[j].cnt = nextcnt;
            Qtemp[j].cntoff = Qtemp[i].cntoff;
            Qtemp[j].interval = Qtemp[i].interval;
            Qtemp[j].unit = Qtemp[i].unit;
            break;
         }
         j++;
      }
      i++;
   }
   if(wait == true)
   {
      currentunit.cnt = fullcnt;
   }
}
function showqueue(wait)
{
   var Qtemp;
   if(wait == true)
   {
      Qtemp = Qhalf;
   }
   else
   {
      Qtemp = Qfull;
   }
   var j = 1;
   while(j < QSIZE)
   {
      eval("queue.q" + j).showpic(Qtemp[j].unit);
      j++;
   }
}
function addprop(row, col, prop)
{
   units.attachMovie(prop,prop + row + "x" + col,(row + col + 1) * 100 + 70 - col * 2);
   var temp = eval("units." + prop + row + "x" + col);
   temp._x = cell_x(row,col);
   temp._y = cell_y(row,col);
}
function copyunit(i, j)
{
   unit[i].unit = unittype[j].unit;
   unit[i].name = unittype[j].name;
   unit[i].hp = unit[i].hpmax = unittype[j].hp;
   unit[i].hpsecret = unittype[j].hpsecret;
   unit[i].movedistance = unittype[j].movedistance;
   unit[i].ap = unittype[j].ap;
   unit[i].df = unittype[j].df;
   unit[i].mdf = unittype[j].mdf;
   unit[i].ag = unittype[j].ag;
   unit[i].spd = unittype[j].spd;
   unit[i].cnt = 100 / unit[i].spd;
   unit[i].cntoff = unittype[j].cntoff;
   unit[i].bloodtype = unittype[j].bloodtype;
   unit[i].damage = unittype[j].damage;
   unit[i].attacktype = unittype[j].attacktype;
   unit[i].range = unittype[j].range;
   unit[i].spread = unittype[j].spread;
   unit[i].attackface = unittype[j].attackface;
   unit[i].attackbump = unittype[j].attackbump;
   unit[i].showfxalways = unittype[j].showfxalways;
   unit[i].attackrecover = unittype[j].attackrecover;
}
_quality = "MEDIUM";
ROWS = COLS = 23;
QSIZE = 14;
Qfull = new Array(QSIZE);
Qhalf = new Array(QSIZE);
var i = 1;
while(i < QSIZE)
{
   Qfull[i] = new Object();
   Qhalf[i] = new Object();
   i++;
}
PLAYER = 0;
ENEMY = 1;
unit = new Array(14);
unittype = new Array(14);
var i = 0;
while(i < 14)
{
   unittype[i] = new Object();
   i++;
}
unittype[0].unit = "Archer";
unittype[0].name = "Hunter";
unittype[0].hp = 2650;
unittype[0].movedistance = 4;
unittype[0].ap = 16;
unittype[0].df = 6;
unittype[0].mdf = 4;
unittype[0].ag = 14;
unittype[0].spd = 15;
unittype[0].cntoff = 9;
unittype[0].bloodtype = "RedBlood";
unittype[0].damage = "physical";
unittype[0].attacktype = "projectile";
unittype[1].unit = "Fighter";
unittype[1].name = "Shadowfist Fighter";
unittype[1].hp = 3200;
unittype[1].movedistance = 5;
unittype[1].ap = 18;
unittype[1].df = 9;
unittype[1].mdf = 0;
unittype[1].ag = 18;
unittype[1].spd = 13;
unittype[1].cntoff = 11;
unittype[1].bloodtype = "RedBlood";
unittype[1].damage = "physical";
unittype[1].attacktype = "normal";
unittype[1].range = 1;
unittype[1].spread = 0;
unittype[1].attackface = true;
unittype[2].unit = "Knight";
unittype[2].name = "Ironclad Sentinel";
unittype[2].hp = 4095;
unittype[2].movedistance = 3;
unittype[2].ap = 17;
unittype[2].df = 15;
unittype[2].mdf = 5;
unittype[2].ag = 6;
unittype[2].spd = 10;
unittype[2].cntoff = 14;
unittype[2].bloodtype = "RedBlood";
unittype[2].damage = "physical";
unittype[2].attacktype = "normal";
unittype[2].range = 1;
unittype[2].spread = 0;
unittype[2].attackface = true;
unittype[3].unit = "Mage";
unittype[3].name = "Templar Mage";
unittype[3].hp = 2405;
unittype[3].movedistance = 3;
unittype[3].ap = 20;
unittype[3].df = 7;
unittype[3].mdf = 9;
unittype[3].ag = 3;
unittype[3].spd = 10;
unittype[3].cntoff = 5;
unittype[3].bloodtype = "RedBlood";
unittype[3].damage = "magic";
unittype[3].attacktype = "line";
unittype[3].range = 4;
unittype[3].showfxalways = true;
unittype[3].attackrecover = false;
unittype[4].unit = "Wizard";
unittype[4].name = "Red Wizard";
unittype[4].hp = 2500;
unittype[4].movedistance = 3;
unittype[4].ap = 30;
unittype[4].df = 4;
unittype[4].mdf = 14;
unittype[4].ag = 0;
unittype[4].spd = 9;
unittype[4].cntoff = 3;
unittype[4].bloodtype = "RedBlood";
unittype[4].damage = "magic";
unittype[4].attacktype = "normal";
unittype[4].range = 3;
unittype[4].spread = 1;
unittype[4].showfxalways = true;
unittype[4].attackrecover = false;
unittype[5].unit = "Healer";
unittype[5].name = "Mystical Healer";
unittype[5].hp = 2170;
unittype[5].movedistance = 4;
unittype[5].ap = 13;
unittype[5].df = 5;
unittype[5].mdf = 10;
unittype[5].ag = 8;
unittype[5].spd = 11;
unittype[5].cntoff = 2;
unittype[5].bloodtype = "RedBlood";
unittype[5].damage = "heal";
unittype[5].attacktype = "normal";
unittype[5].range = 1;
unittype[5].spread = 0;
unittype[5].attackbump = false;
unittype[6].unit = "Assassin";
unittype[6].name = "Shadowblade Assassin";
unittype[6].hp = 2410;
unittype[6].movedistance = 5;
unittype[6].ap = 15;
unittype[6].df = 5;
unittype[6].mdf = 5;
unittype[6].ag = 20;
unittype[6].spd = 18;
unittype[6].cntoff = 10;
unittype[6].bloodtype = "RedBlood";
unittype[6].damage = "physical";
unittype[6].attacktype = "normal";
unittype[6].range = 1;
unittype[6].spread = 0;
unittype[6].attackface = true;
unittype[7].unit = "GateKeeper";
unittype[7].name = "Talon Guard";
unittype[7].hp = 2705;
unittype[7].movedistance = 4;
unittype[7].ap = 18;
unittype[7].df = 6;
unittype[7].mdf = 8;
unittype[7].ag = 11;
unittype[7].spd = 14;
unittype[7].cntoff = 8;
unittype[7].bloodtype = "RedBlood";
unittype[7].damage = "magic";
unittype[7].attacktype = "projectile";
unittype[8].unit = "DarkSoldier";
unittype[8].name = "Talon Soldier";
unittype[8].hp = 3170;
unittype[8].movedistance = 4;
unittype[8].ap = 22;
unittype[8].df = 8;
unittype[8].mdf = 8;
unittype[8].ag = 8;
unittype[8].spd = 14;
unittype[8].cntoff = 12;
unittype[8].bloodtype = "RedBlood";
unittype[8].damage = "physical";
unittype[8].attacktype = "normal";
unittype[8].range = 1;
unittype[8].spread = 0;
unittype[8].attackface = true;
unittype[9].unit = "Cleric";
unittype[9].name = "Cleric";
unittype[9].hp = 2505;
unittype[9].movedistance = 3;
unittype[9].ap = 16;
unittype[9].df = 7;
unittype[9].mdf = 7;
unittype[9].ag = 2;
unittype[9].spd = 11;
unittype[9].cntoff = 1;
unittype[9].bloodtype = "RedBlood";
unittype[9].damage = "heal";
unittype[9].attacktype = "normal";
unittype[9].range = 4;
unittype[9].spread = 0;
unittype[9].attackbump = false;
unittype[9].showfxalways = true;
unittype[10].unit = "Angel";
unittype[10].name = "Daemon";
unittype[10].hp = 5000;
unittype[10].hpsecret = true;
unittype[10].movedistance = 6;
unittype[10].ap = 250;
unittype[10].df = 0;
unittype[10].mdf = 0;
unittype[10].ag = 20;
unittype[10].spd = 11;
unittype[10].cntoff = 7;
unittype[10].bloodtype = "RedBlood";
unittype[10].damage = "magic";
unittype[10].attacktype = "normal";
unittype[10].range = 4;
unittype[10].spread = 0;
unittype[10].showfxalways = true;
unittype[11].unit = "Swordsman";
unittype[11].name = "Macabre Swordsman";
unittype[11].hp = 2660;
unittype[11].movedistance = 3;
unittype[11].ap = 19;
unittype[11].df = 8;
unittype[11].mdf = 3;
unittype[11].ag = 14;
unittype[11].spd = 15;
unittype[11].cntoff = 13;
unittype[11].bloodtype = "RedBlood";
unittype[11].damage = "physical";
unittype[11].attacktype = "normal";
unittype[11].range = 1;
unittype[11].spread = 0;
unittype[11].attackface = true;
unittype[11].attackrecover = false;
unittype[12].unit = "Striker";
unittype[12].name = "Templar Striker";
unittype[12].hp = 2400;
unittype[12].movedistance = 4;
unittype[12].ap = 15;
unittype[12].df = 7;
unittype[12].mdf = 7;
unittype[12].ag = 4;
unittype[12].spd = 10;
unittype[12].cntoff = 6;
unittype[12].bloodtype = "RedBlood";
unittype[12].damage = "magic";
unittype[12].attacktype = "line";
unittype[12].range = 2;
unittype[12].showfxalways = true;
unittype[12].attackrecover = false;
unittype[13].unit = "Sorceress";
unittype[13].name = "Mystical Sorceress";
unittype[13].hp = 2240;
unittype[13].movedistance = 2;
unittype[13].ap = 21;
unittype[13].df = 0;
unittype[13].mdf = 20;
unittype[13].ag = 0;
unittype[13].spd = 8;
unittype[13].cntoff = 4;
unittype[13].bloodtype = "RedBlood";
unittype[13].damage = "magic";
unittype[13].attacktype = "normal";
unittype[13].range = 5;
unittype[13].spread = 2;
unittype[13].showfxalways = true;
unittype[13].attackrecover = false;
bloodcount = 0;
bloods = new Array(ROWS);
map = new Array(ROWS);
var row = 0;
while(row < ROWS)
{
   bloods[row] = new Array(COLS);
   map[row] = new Array(COLS);
   var col = 0;
   while(col < COLS)
   {
      bloods[row][col] = 0;
      if(row > 6 && row < 18 && col > 6 && col < 18)
      {
         map[row][col] = -1;
      }
      else
      {
         map[row][col] = null;
      }
      col++;
   }
   row++;
}
map[16][7] = map[17][7] = map[17][8] = map[7][16] = map[7][17] = map[8][17] = null;
var i = 9;
while(i < 14)
{
   map[7][i] = -2;
   i++;
}
map[8][7] = -2;
var i = 10;
while(i < 15)
{
   map[8][i] = -2;
   i++;
}
map[9][7] = map[9][8] = -2;
var i = 10;
while(i < 14)
{
   map[9][i] = -2;
   i++;
}
map[10][7] = map[10][8] = map[11][8] = map[11][9] = map[12][17] = map[13][15] = -2;
var i = 14;
while(i < 17)
{
   map[14][i] = -2;
   i++;
}
var i = 11;
while(i < 17)
{
   map[15][i] = -2;
   i++;
}
var i = 10;
while(i < 18)
{
   map[16][i] = -2;
   i++;
}
var i = 11;
while(i < 18)
{
   map[17][i] = -2;
   i++;
}
addprop(8,12,"FireHole");
addprop(16,12,"FireHole");
addprop(8,10,"SmokeHole");
cells.attachMovie("Blank","grid",60);
cells.attachMovie("Blank","unitcells",90);
var row = 0;
while(row < ROWS)
{
   var col = 0;
   while(col < COLS)
   {
      if(map[row][col] != null)
      {
         var tempname = "g" + row + "x" + col;
         cells.grid.attachMovie("GridCell",tempname,100 * row + col);
         var tempcell = eval("cells.grid." + tempname);
         tempcell.row = row;
         tempcell.col = col;
      }
      col++;
   }
   row++;
}
NUM_UNITS = 13;
allystatcount = 0;
var i = 0;
while(i < NUM_UNITS)
{
   units.attachMovie("Unit","unit" + i,i);
   cells.unitcells.attachMovie("UnitCell","cell" + i,i);
   unit[i] = eval("units.unit" + i);
   unit[i].unitcell = eval("cells.unitcells.cell" + i);
   unit[i].unitcell.unit = unit[i];
   unit[i].control = i < 7;
   if(i > 6)
   {
      unit[i].direction = 1;
      unit[i].team = ENEMY;
   }
   else
   {
      unit[i].direction = 3;
      unit[i].team = PLAYER;
   }
   switch(i)
   {
      case 0:
         j = 5;
         unit[i].row = 10;
         unit[i].col = 17;
         break;
      case 1:
         j = 0;
         unit[i].row = 13;
         unit[i].col = 17;
         break;
      case 2:
         j = 3;
         unit[i].row = 11;
         unit[i].col = 16;
         break;
      case 3:
         j = 4;
         unit[i].row = 12;
         unit[i].col = 16;
         break;
      case 4:
         j = 6;
         unit[i].row = 10;
         unit[i].col = 16;
         break;
      case 5:
         j = 1;
         unit[i].row = 11;
         unit[i].col = 15;
         break;
      case 6:
         j = 2;
         unit[i].row = 12;
         unit[i].col = 15;
         break;
      case 7:
         j = 7;
         unit[i].row = 12;
         unit[i].col = 10;
         break;
      case 8:
         j = 8;
         unit[i].row = 11;
         unit[i].col = 10;
         break;
      case 9:
         j = 9;
         unit[i].row = 12;
         unit[i].col = 8;
         break;
      case 10:
         j = 13;
         unit[i].row = 12;
         unit[i].col = 9;
         break;
      case 11:
         j = 11;
         unit[i].row = 10;
         unit[i].col = 9;
         break;
      case 12:
         j = 12;
         unit[i].row = 13;
         unit[i].col = 9;
   }
   copyunit(i,j);
   map[unit[i].row][unit[i].col] = unit[i];
   if(unit[i].team == PLAYER)
   {
      allystats.attachMovie("AllyStat",unit[i].name,allystatcount++);
      var tempallystat = eval("allystats." + unit[i].name);
      tempallystat._y = 0;
      tempallystat._x = (- tempallystat._width) * allystatcount * 1.4;
      tempallystat.pic.gotoAndStop(unit[i].unit);
      tempallystat.unit = unit[i];
   }
   i++;
}
hidecells();
if(muted != true)
{
   BGM.gotoAndStop("On");
}
allystats._visible = queue._visible = activestats._visible = targetstats._visible = false;
