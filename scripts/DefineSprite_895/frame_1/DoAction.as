function calcattackpoints()
{
   var points = 0;
   var row = _parent.currentunit.row;
   var col = _parent.currentunit.col;
   if(_parent.currentunit.attacktype == "normal")
   {
      var temprow = row - _parent.currentunit.range;
      while(temprow <= row + _parent.currentunit.range)
      {
         var tempcol = col - _parent.currentunit.range + Math.abs(row - temprow);
         while(tempcol <= col + _parent.currentunit.range - Math.abs(row - temprow))
         {
            if((temprow != row || tempcol != col) && _parent.map[temprow][tempcol] != null && _parent.map[temprow][tempcol] != -2)
            {
               var temppoints = 0;
               var srow = temprow - _parent.currentunit.spread;
               while(srow <= temprow + _parent.currentunit.spread)
               {
                  var spread1 = _parent.currentunit.spread - Math.abs(temprow - srow);
                  var scol = tempcol - spread1;
                  while(scol <= tempcol + spread1)
                  {
                     if(row != srow || col != scol)
                     {
                        if(_parent.map[srow][scol] != null && _parent.map[srow][scol] != -2 && _parent.map[srow][scol] != -1)
                        {
                           temppoints += calcdamage(_parent.currentunit,_parent.map[srow][scol]);
                        }
                     }
                     scol++;
                  }
                  srow++;
               }
               if(temppoints > points)
               {
                  points = temppoints;
                  tempattackrow = temprow;
                  tempattackcol = tempcol;
               }
            }
            tempcol++;
         }
         temprow++;
      }
   }
   else if(_parent.currentunit.attacktype == "line")
   {
      var temppoints = 0;
      var temprow = row - _parent.currentunit.range;
      while(temprow < row)
      {
         if(_parent.map[temprow][col] != null && _parent.map[temprow][col] != -2 && _parent.map[temprow][col] != -1)
         {
            temppoints += calcdamage(_parent.currentunit,_parent.map[temprow][col]);
         }
         temprow++;
      }
      if(temppoints > points)
      {
         points = temppoints;
         tempattackrow = row - 1;
         tempattackcol = col;
      }
      temppoints = 0;
      var temprow = row + _parent.currentunit.range;
      while(temprow > row)
      {
         if(_parent.map[temprow][col] != null && _parent.map[temprow][col] != -2 && _parent.map[temprow][col] != -1)
         {
            temppoints += calcdamage(_parent.currentunit,_parent.map[temprow][col]);
         }
         temprow--;
      }
      if(temppoints > points)
      {
         points = temppoints;
         tempattackrow = row + 1;
         tempattackcol = col;
      }
      temppoints = 0;
      var tempcol = col - _parent.currentunit.range;
      while(tempcol < col)
      {
         if(_parent.map[row][tempcol] != null && _parent.map[row][tempcol] != -2 && _parent.map[row][tempcol] != -1)
         {
            temppoints += calcdamage(_parent.currentunit,_parent.map[row][tempcol]);
         }
         tempcol++;
      }
      if(temppoints > points)
      {
         points = temppoints;
         tempattackrow = row;
         tempattackcol = col - 1;
      }
      temppoints = 0;
      var tempcol = col + _parent.currentunit.range;
      while(tempcol > col)
      {
         if(_parent.map[row][tempcol] != null && _parent.map[row][tempcol] != -2 && _parent.map[row][tempcol] != -1)
         {
            temppoints += calcdamage(_parent.currentunit,_parent.map[row][tempcol]);
         }
         tempcol--;
      }
      if(temppoints > points)
      {
         points = temppoints;
         tempattackrow = row;
         tempattackcol = col + 1;
      }
   }
   else if(_parent.currentunit.attacktype == "projectile")
   {
      var temprow = row;
      var tempcol = col;
      var currange = 0;
      while(_parent.map[temprow][++tempcol] != null)
      {
         currange++;
         if(!(_parent.map[temprow][tempcol] == -1 || _parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > 1 && _parent.map[temprow][tempcol] != null)
      {
         var temppoints = calcdamage(_parent.currentunit,_parent.map[temprow][tempcol]);
         if(temppoints > points)
         {
            points = temppoints;
            tempattackrow = temprow;
            tempattackcol = tempcol;
         }
      }
      tempcol = col;
      currange = 0;
      while(_parent.map[++temprow][tempcol] != null)
      {
         currange++;
         if(!(_parent.map[temprow][tempcol] == -1 || _parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > 1 && _parent.map[temprow][tempcol] != null)
      {
         var temppoints = calcdamage(_parent.currentunit,_parent.map[temprow][tempcol]);
         if(temppoints > points)
         {
            points = temppoints;
            tempattackrow = temprow;
            tempattackcol = tempcol;
         }
      }
      temprow = row;
      currange = 0;
      while(_parent.map[temprow][--tempcol] != null)
      {
         currange++;
         if(!(_parent.map[temprow][tempcol] == -1 || _parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > 1 && _parent.map[temprow][tempcol] != null)
      {
         var temppoints = calcdamage(_parent.currentunit,_parent.map[temprow][tempcol]);
         if(temppoints > points)
         {
            points = temppoints;
            tempattackrow = temprow;
            tempattackcol = tempcol;
         }
      }
      tempcol = col;
      currange = 0;
      while(_parent.map[--temprow][tempcol] != null)
      {
         currange++;
         if(!(_parent.map[temprow][tempcol] == -1 || _parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > 1 && _parent.map[temprow][tempcol] != null)
      {
         var temppoints = calcdamage(_parent.currentunit,_parent.map[temprow][tempcol]);
         if(temppoints > points)
         {
            points = temppoints;
            tempattackrow = temprow;
            tempattackcol = tempcol;
         }
      }
   }
   return points;
}
function calctargettedpoints1(aunit)
{
   var row = aunit.row;
   var col = aunit.col;
   if(aunit.attacktype == "normal")
   {
      var range1 = aunit.range + aunit.spread;
      var temprow = row - range1;
      while(temprow <= row + range1)
      {
         var tempcol = col - range1 + Math.abs(row - temprow);
         while(tempcol <= col + range1 - Math.abs(row - temprow))
         {
            if(_parent.currentunit.row == temprow && _parent.currentunit.col == tempcol)
            {
               return calcdamage(aunit,_parent.currentunit);
            }
            tempcol++;
         }
         temprow++;
      }
   }
   else if(aunit.attacktype == "line")
   {
      var temprow = row - aunit.range;
      while(temprow <= row + aunit.range)
      {
         if(_parent.currentunit.row == temprow && _parent.currentunit.col == col)
         {
            return calcdamage(aunit,_parent.currentunit);
         }
         temprow++;
      }
      var tempcol = col - aunit.range;
      while(tempcol <= col + aunit.range)
      {
         if(_parent.currentunit.row == row && _parent.currentunit.col == tempcol)
         {
            return calcdamage(aunit,_parent.currentunit);
         }
         tempcol++;
      }
   }
   else if(aunit.attacktype == "projectile")
   {
      var temprow = row;
      var tempcol = col;
      var currange = 0;
      while(_parent.map[temprow][++tempcol] != null)
      {
         currange++;
         if(!(_parent.map[temprow][tempcol] == -1 || _parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > 1 && _parent.currentunit.row == temprow && _parent.currentunit.col == tempcol)
      {
         return calcdamage(aunit,_parent.currentunit);
      }
      tempcol = col;
      currange = 0;
      while(_parent.map[++temprow][tempcol] != null)
      {
         currange++;
         if(!(_parent.map[temprow][tempcol] == -1 || _parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > 1 && _parent.currentunit.row == temprow && _parent.currentunit.col == tempcol)
      {
         return calcdamage(aunit,_parent.currentunit);
      }
      temprow = row;
      currange = 0;
      while(_parent.map[temprow][--tempcol] != null)
      {
         currange++;
         if(!(_parent.map[temprow][tempcol] == -1 || _parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > 1 && _parent.currentunit.row == temprow && _parent.currentunit.col == tempcol)
      {
         return calcdamage(aunit,_parent.currentunit);
      }
      tempcol = col;
      currange = 0;
      while(_parent.map[--temprow][tempcol] != null)
      {
         currange++;
         if(!(_parent.map[temprow][tempcol] == -1 || _parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > 1 && _parent.currentunit.row == temprow && _parent.currentunit.col == tempcol)
      {
         return calcdamage(aunit,_parent.currentunit);
      }
   }
   return 0;
}
function calctargettedpoints(wait)
{
   var fullcnt;
   var points = 0;
   var allycount = 0;
   var enemycount = 0;
   var allyrows = 0;
   var allycols = 0;
   var enemyrows = 0;
   var enemycols = 0;
   var trow;
   var tcol;
   var tpoints = 0;
   if(wait == true)
   {
      fullcnt = _parent.currentunit.cnt;
      _parent.currentunit.cnt /= 2;
   }
   var i = 0;
   while(i < _parent.unit.length)
   {
      if(_parent.unit[i].unitcell != null && _parent.unit[i] != _parent.currentunit)
      {
         var rowpoints = Math.abs(_parent.unit[i].row - _parent.currentunit.row);
         var colpoints = Math.abs(_parent.unit[i].col - _parent.currentunit.col);
         if(_parent.unit[i].team == _parent.currentunit.team)
         {
            allycount++;
            allyrows += rowpoints;
            allycols += colpoints;
            if(_parent.unit[i].damage == "heal")
            {
               var temppoints = calctargettedpoints1(_parent.unit[i]);
               if(_parent.currentunit.cnt < _parent.unit[i].cnt)
               {
                  temppoints /= 6;
               }
               points += temppoints;
            }
            if(_parent.currentunit.damage == "heal")
            {
               var temppoints = calcdamage(_parent.currentunit,_parent.unit[i]) * Math.pow(0.98,_parent.unit[i].row + _parent.unit[i].col);
               if(temppoints > tpoints)
               {
                  tpoints = temppoints;
                  trow = _parent.unit[i].row;
                  tcol = _parent.unit[i].col;
               }
            }
         }
         else
         {
            enemycount++;
            enemyrows += rowpoints;
            enemycols += colpoints;
            if(_parent.unit[i].damage != "heal")
            {
               var temppoints = calctargettedpoints1(_parent.unit[i]);
               if(_parent.currentunit.cnt < _parent.unit[i].cnt)
               {
                  temppoints /= 10;
               }
               points -= temppoints;
            }
            if(_parent.currentunit.damage != "heal")
            {
               var temppoints = calcdamage(_parent.currentunit,_parent.unit[i]) * Math.pow(0.98,_parent.unit[i].row + _parent.unit[i].col);
               if(temppoints > tpoints)
               {
                  tpoints = temppoints;
                  trow = _parent.unit[i].row;
                  tcol = _parent.unit[i].col;
               }
            }
         }
      }
      i++;
   }
   var pospoints = 0;
   var negpoints = 0;
   var hpfactor = _parent.currentunit.hp / _parent.currentunit.hpmax;
   var allypoints = allyrows + allycols;
   var enemypoints = enemyrows + enemycols;
   if(allypoints * allycount > 0)
   {
      allypoints = 1 / Math.pow(allypoints / allycount,1 / allycount);
   }
   else
   {
      allypoints = 0;
   }
   if(enemypoints * enemycount > 0)
   {
      enemypoints = 1 / Math.pow(enemypoints / enemycount,1 / enemycount);
   }
   else
   {
      enemypoints = 0;
   }
   if(tpoints > 0)
   {
      trow = Math.abs(trow - _parent.currentunit.row);
      tcol = Math.abs(tcol - _parent.currentunit.col);
      tpoints = 1 / (trow + tcol);
   }
   if(_parent.currentunit.damage == "heal")
   {
      pospoints += allypoints / 100 + tpoints;
      negpoints += enemypoints / 100;
   }
   else if(_parent.currentunit.attacktype == "projectile")
   {
      if(enemypoints > 0)
      {
         pospoints += 0.01 / Math.pow((Math.min(enemyrows,enemycols) + 1) / enemycount,1 / enemycount);
         negpoints += 0.01 / Math.pow((Math.max(enemyrows,enemycols) + 1) / enemycount,1 / enemycount);
      }
      if(tpoints > 0)
      {
         pospoints += 1 / (Math.min(trow,tcol) + 1);
         negpoints += 1 / (Math.max(trow,tcol) + 1);
      }
      pospoints += allypoints / 10000;
   }
   else
   {
      pospoints += tpoints + allypoints / 100;
   }
   if(_parent.currentunit.hp < Math.pow(_parent.currentunit.hpmax,0.8))
   {
      pospoints = pospoints / 100 + allypoints / 100;
      negpoints = negpoints / 100 + enemypoints;
   }
   if(wait == true)
   {
      _parent.currentunit.cnt = fullcnt;
      if(points > 0)
      {
         points *= 2 - hpfactor;
      }
   }
   return points + pospoints - negpoints;
}
function calcdamage(aunit, tunit)
{
   var mindmg;
   var maxdmg;
   if(aunit.damage == "heal")
   {
      mindmg = aunit.ap * 50;
      maxdmg = mindmg + mindmg * aunit.ap / 300;
   }
   else
   {
      var tdf;
      if(aunit.damage == "magic")
      {
         tdf = tunit.mdf;
      }
      else
      {
         tdf = tunit.df;
      }
      maxdmg = mindmg = (aunit.ap - tdf) * 50;
      if(aunit.damage == "magic")
      {
         maxdmg += maxdmg * aunit.ap / 300;
         mindmg -= mindmg * tdf / 200;
      }
      else
      {
         maxdmg += maxdmg * aunit.ag / 100;
         mindmg -= mindmg * tunit.ag / 50;
      }
   }
   if(mindmg < 0)
   {
      mindmg = 0;
   }
   else if(mindmg > 9999)
   {
      mindmg = 9999;
   }
   if(maxdmg < 0)
   {
      maxdmg = 0;
   }
   else if(maxdmg > 9999)
   {
      maxdmg = 9999;
   }
   if(tunit.team == _parent.currentunit.team && aunit.damage != "heal" || tunit.team != _parent.currentunit.team && aunit.damage == "heal")
   {
      mindmg = (mindmg + 4 * maxdmg) / 5;
   }
   else
   {
      mindmg = (4 * mindmg + maxdmg) / 5;
   }
   if(aunit.damage == "heal")
   {
      if(tunit.hpmax - tunit.hp <= mindmg)
      {
         mindmg = tunit.hpmax - tunit.hp;
      }
      else
      {
         mindmg /= 0.3 + 0.7 * tunit.hp / tunit.hpmax;
      }
      mindmg = (- mindmg) / 2;
   }
   else if(tunit.hp <= mindmg)
   {
      mindmg = (tunit.hp + tunit.hpmax) / 2 + tunit.ap * 50 + (tunit.df + tunit.mdf) * 25 + (tunit.ag + tunit.spd) * 5;
      if(aunit == _parent.currentunit && aunit.team != tunit.team && tunit.damage != "heal")
      {
         mindmg += calcdamage(tunit,aunit) / (0.1 + aunit.hp / aunit.hpmax) / 10;
      }
   }
   else
   {
      mindmg /= 0.4 + 0.6 * (tunit.hp - mindmg) / tunit.hpmax;
   }
   if(aunit.team == tunit.team)
   {
      mindmg = - mindmg;
   }
   if(mindmg < 0)
   {
      mindmg *= 2.5;
   }
   return mindmg;
}
function attack()
{
   attacked = true;
   if(attackrow == null || attackcol == null)
   {
      endact();
   }
   else
   {
      if(_parent.map[attackrow][attackcol].unitcell != null)
      {
         _parent.targetstats.showstats(_parent.map[attackrow][attackcol]);
      }
      var facedirection;
      if(Math.abs(attackrow - _parent.currentunit.row) < Math.abs(attackcol - _parent.currentunit.col))
      {
         if(attackcol > _parent.currentunit.col)
         {
            facedirection = 1;
         }
         else
         {
            facedirection = 3;
         }
      }
      else if(attackrow > _parent.currentunit.row)
      {
         facedirection = 2;
      }
      else
      {
         facedirection = 4;
      }
      if(_parent.currentunit.attacktype == "normal")
      {
         if(_parent.currentunit.spread <= 0)
         {
            _parent.doattack(facedirection,attackrow,attackcol);
         }
         else
         {
            var area = new Array();
            var coords = new Object();
            coords.row = attackrow;
            coords.col = attackcol;
            area.push(coords);
            var i = 1;
            while(i <= _parent.currentunit.spread)
            {
               var temprow;
               var tempcol;
               temprow = attackrow;
               tempcol = attackcol + i;
               while(tempcol > attackcol)
               {
                  if(temprow != _parent.currentunit.row || tempcol != _parent.currentunit.col)
                  {
                     if(_parent.map[temprow][tempcol] != null && _parent.map[temprow][tempcol] != -2)
                     {
                        var coords = new Object();
                        coords.row = temprow;
                        coords.col = tempcol;
                        area.push(coords);
                     }
                  }
                  temprow++;
                  tempcol--;
               }
               temprow = attackrow + i;
               tempcol = attackcol;
               while(temprow > attackrow)
               {
                  if(temprow != _parent.currentunit.row || tempcol != _parent.currentunit.col)
                  {
                     if(_parent.map[temprow][tempcol] != null && _parent.map[temprow][tempcol] != -2)
                     {
                        var coords = new Object();
                        coords.row = temprow;
                        coords.col = tempcol;
                        area.push(coords);
                     }
                  }
                  temprow--;
                  tempcol--;
               }
               temprow = attackrow;
               tempcol = attackcol - i;
               while(tempcol < attackcol)
               {
                  if(temprow != _parent.currentunit.row || tempcol != _parent.currentunit.col)
                  {
                     if(_parent.map[temprow][tempcol] != null && _parent.map[temprow][tempcol] != -2)
                     {
                        var coords = new Object();
                        coords.row = temprow;
                        coords.col = tempcol;
                        area.push(coords);
                     }
                  }
                  temprow--;
                  tempcol++;
               }
               temprow = attackrow - i;
               tempcol = attackcol;
               while(temprow < attackrow)
               {
                  if(temprow != _parent.currentunit.row || tempcol != _parent.currentunit.col)
                  {
                     if(_parent.map[temprow][tempcol] != null && _parent.map[temprow][tempcol] != -2)
                     {
                        var coords = new Object();
                        coords.row = temprow;
                        coords.col = tempcol;
                        area.push(coords);
                     }
                  }
                  temprow++;
                  tempcol++;
               }
               i++;
            }
            _parent.doattack(facedirection,null,null,area);
         }
      }
      else if(_parent.currentunit.attacktype == "line")
      {
         var temprow = _parent.currentunit.row;
         var tempcol = _parent.currentunit.col;
         var area = new Array();
         var i = 0;
         while(i < _parent.currentunit.range)
         {
            if(attackcol > _parent.currentunit.col)
            {
               tempcol++;
            }
            else if(attackrow > _parent.currentunit.row)
            {
               temprow++;
            }
            else if(attackcol < _parent.currentunit.col)
            {
               tempcol--;
            }
            else if(attackrow < _parent.currentunit.row)
            {
               temprow--;
            }
            if(_parent.map[temprow][tempcol] != null && _parent.map[temprow][tempcol] != -2)
            {
               var coords = new Object();
               coords.row = temprow;
               coords.col = tempcol;
               area.push(coords);
            }
            i++;
         }
         _parent.doattack(facedirection,null,null,area);
      }
      else if(_parent.currentunit.attacktype == "projectile")
      {
         _parent.doattack(facedirection,attackrow,attackcol);
      }
   }
}
function calcmovepoints(cellrow, cellcol, distance)
{
   if(distance <= 0)
   {
      return undefined;
   }
   if(dbuffer[cellrow][cellcol] != undefined && dbuffer[cellrow][cellcol] >= distance)
   {
      return undefined;
   }
   if(_parent.map[cellrow][cellcol] != -1 && _parent.map[cellrow][cellcol].team != _parent.currentunit.team)
   {
      return undefined;
   }
   dbuffer[cellrow][cellcol] = distance;
   var temprow = new Array(cellrow,cellrow + 1,cellrow,cellrow - 1);
   var tempcol = new Array(cellcol + 1,cellcol,cellcol - 1,cellcol);
   var oldrow = _parent.currentunit.row;
   var oldcol = _parent.currentunit.col;
   _parent.map[oldrow][oldcol] = -1;
   var i = 0;
   while(i < 4)
   {
      if(_parent.map[temprow[i]][tempcol[i]] == -1 && tbuffer[temprow[i]][tempcol[i]] == undefined)
      {
         _parent.currentunit.row = temprow[i];
         _parent.currentunit.col = tempcol[i];
         _parent.map[temprow[i]][tempcol[i]] = _parent.currentunit;
         var attackpoints;
         if(attacked)
         {
            attackpoints = 0;
         }
         else
         {
            attackpoints = calcattackpoints();
         }
         tbuffer[temprow[i]][tempcol[i]] = attackpoints * (0.1 + _parent.currentunit.hp / _parent.currentunit.hpmax) + calctargettedpoints() / 10;
         if(tbuffer[temprow[i]][tempcol[i]] > tbuffer[moverow][movecol])
         {
            if(attackpoints > 0)
            {
               if(attackrow == tempattackrow && attackcol == tempattackcol && moverow == oldrow && movecol == oldcol)
               {
                  tbuffer[moverow][movecol] = tbuffer[temprow[i]][tempcol[i]];
               }
               else
               {
                  attackrow = tempattackrow;
                  attackcol = tempattackcol;
                  moverow = temprow[i];
                  movecol = tempcol[i];
               }
            }
            else if(attacked || attackrow == null || attackcol == null)
            {
               attackrow = attackcol = null;
               moverow = temprow[i];
               movecol = tempcol[i];
            }
            else
            {
               tbuffer[moverow][movecol] = tbuffer[temprow[i]][tempcol[i]];
            }
         }
         _parent.map[temprow[i]][tempcol[i]] = -1;
      }
      i++;
   }
   _parent.map[oldrow][oldcol] = _parent.currentunit;
   _parent.currentunit.row = oldrow;
   _parent.currentunit.col = oldcol;
   distance--;
   var i = 0;
   while(i < 4)
   {
      calcmovepoints(temprow[i],tempcol[i],distance);
      i++;
   }
}
function move()
{
   dbuffer = new Array(_parent.ROWS);
   tbuffer = new Array(_parent.ROWS);
   var i = 0;
   while(i < _parent.ROWS)
   {
      dbuffer[i] = new Array(_parent.COLS);
      tbuffer[i] = new Array(_parent.COLS);
      i++;
   }
   moverow = _parent.currentunit.row;
   movecol = _parent.currentunit.col;
   if(!attacked)
   {
      tbuffer[_parent.currentunit.row][_parent.currentunit.col] = calcattackpoints() * (0.1 + _parent.currentunit.hp / _parent.currentunit.hpmax);
      if(tbuffer[_parent.currentunit.row][_parent.currentunit.col] > 0)
      {
         tbuffer[_parent.currentunit.row][_parent.currentunit.col] += 0.2;
         attackrow = tempattackrow;
         attackcol = tempattackcol;
      }
      else
      {
         attackrow = attackcol = null;
         tbuffer[_parent.currentunit.row][_parent.currentunit.col] = calctargettedpoints(true) / 10;
      }
   }
   else
   {
      tbuffer[_parent.currentunit.row][_parent.currentunit.col] = calctargettedpoints(!_parent.currentunit.attacked) / 10;
   }
   calcmovepoints(_parent.currentunit.row,_parent.currentunit.col,_parent.currentunit.movedistance);
   delete dbuffer;
   delete tbuffer;
   if(moverow != _parent.currentunit.row || movecol != _parent.currentunit.col)
   {
      moved = true;
      _parent.domove(moverow,movecol);
   }
   else if(attacked)
   {
      moved = true;
      endact();
   }
   else
   {
      attack();
   }
}
function act()
{
   moved = attacked = false;
   gotoAndPlay(2);
}
function endact()
{
   gotoAndPlay(2);
}
stop();
