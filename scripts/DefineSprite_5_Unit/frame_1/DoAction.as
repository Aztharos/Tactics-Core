function attackcommand()
{
   _parent._parent.showcells();
   _parent._parent.cells.attachMovie("Blank","attackcells",100);
   _parent._parent.cells.attackcells._x = _parent._parent.cells.attackcells._y = 0;
   _parent._parent.cells.attackcells.attachMovie("CancelCell","cancelcell",100 * row + col);
   _parent._parent.cells.attackcells.cancelcell.row = row;
   _parent._parent.cells.attackcells.cancelcell.col = col;
   _parent._parent.cells.attackcells.attacktype = attacktype;
   _parent._parent.cells.attackcells.crow = row;
   _parent._parent.cells.attackcells.ccol = col;
   if(attacktype == "normal")
   {
      _parent._parent.cells.attackcells.spread = spread;
      var temprow = row - range;
      while(temprow <= row + range)
      {
         var range1 = range - Math.abs(row - temprow);
         var tempcol = col - range1;
         while(tempcol <= col + range1)
         {
            if((temprow != row || tempcol != col) && _parent._parent.map[temprow][tempcol] != null && _parent._parent.map[temprow][tempcol] != -2)
            {
               showattackcell(temprow,tempcol);
            }
            tempcol++;
         }
         temprow++;
      }
   }
   else if(attacktype == "line")
   {
      _parent._parent.cells.attackcells.range = range;
      var temprow = row - range;
      while(temprow <= row + range)
      {
         if(temprow != row && _parent._parent.map[temprow][col] != null && _parent._parent.map[temprow][col] != -2)
         {
            showattackcell(temprow,col);
         }
         temprow++;
      }
      var tempcol = col - range;
      while(tempcol <= col + range)
      {
         if(tempcol != col && _parent._parent.map[row][tempcol] != null && _parent._parent.map[row][tempcol] != -2)
         {
            showattackcell(row,tempcol);
         }
         tempcol++;
      }
   }
   else if(attacktype == "projectile")
   {
      var temprow = row;
      var tempcol = col;
      var temprange = 0;
      var currange = 0;
      while(_parent._parent.map[temprow][++tempcol] != null)
      {
         if(currange++ > 0)
         {
            if(_parent._parent.map[temprow][tempcol] != -2)
            {
               showattackcell(temprow,tempcol);
            }
         }
         if(!(_parent._parent.map[temprow][tempcol] == -1 || _parent._parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > temprange)
      {
         temprange = currange;
      }
      tempcol = col;
      currange = 0;
      while(_parent._parent.map[++temprow][tempcol] != null)
      {
         if(currange++ > 0)
         {
            if(_parent._parent.map[temprow][tempcol] != -2)
            {
               showattackcell(temprow,tempcol);
            }
         }
         if(!(_parent._parent.map[temprow][tempcol] == -1 || _parent._parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > temprange)
      {
         temprange = currange;
      }
      temprow = row;
      currange = 0;
      while(_parent._parent.map[temprow][--tempcol] != null)
      {
         if(currange++ > 0)
         {
            if(_parent._parent.map[temprow][tempcol] != -2)
            {
               showattackcell(temprow,tempcol);
            }
         }
         if(!(_parent._parent.map[temprow][tempcol] == -1 || _parent._parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > temprange)
      {
         temprange = currange;
      }
      tempcol = col;
      currange = 0;
      while(_parent._parent.map[--temprow][tempcol] != null)
      {
         if(currange++ > 0)
         {
            if(_parent._parent.map[temprow][tempcol] != -2)
            {
               showattackcell(temprow,tempcol);
            }
         }
         if(!(_parent._parent.map[temprow][tempcol] == -1 || _parent._parent.map[temprow][tempcol] == -2))
         {
            break;
         }
      }
      if(currange > temprange)
      {
         temprange = currange;
      }
      _parent._parent.cells.attackcells.range = temprange;
   }
}
function showattackcell(temprow, tempcol)
{
   var tempcell = "cell" + temprow + "x" + tempcol;
   _parent._parent.cells.attackcells.attachMovie("AttackCell",tempcell,100 * temprow + tempcol);
   eval("_parent._parent.cells.attackcells." + tempcell).row = temprow;
   eval("_parent._parent.cells.attackcells." + tempcell).col = tempcol;
}
function movecommand()
{
   _parent._parent.showcells();
   _parent._parent.cells.attachMovie("Blank","movecells",100);
   _parent._parent.cells.movecells._x = _parent._parent.cells.movecells._y = 0;
   _parent._parent.cells.movecells.attachMovie("CancelCell","cancelcell",100 * row + col);
   _parent._parent.cells.movecells.cancelcell.row = row;
   _parent._parent.cells.movecells.cancelcell.col = col;
   dbuffer = new Array(_parent._parent.ROWS);
   var i = 0;
   while(i < _parent._parent.ROWS)
   {
      dbuffer[i] = new Array(_parent._parent.COLS);
      i++;
   }
   showmovegrid(row,col,movedistance,"movecells","MoveCell");
   delete dbuffer;
}
function undocommand()
{
   if(undorow == undefined)
   {
      undorow = row;
   }
   if(undocol == undefined)
   {
      undocol = col;
   }
   if(undodirection == undefined)
   {
      undodirection = direction;
   }
   gotoAndPlay(48);
}
function showmoverange()
{
   if(_parent._parent.cells.moverangecells.cancelcell.row == row && _parent._parent.cells.moverangecells.cancelcell.col == col)
   {
      _parent._parent.cells.moverangecells.removeMovieClip();
      return undefined;
   }
   _parent._parent.cells.attachMovie("Blank","moverangecells",50);
   _parent._parent.cells.moverangecells._x = _parent._parent.cells.moverangecells._y = 0;
   _parent._parent.cells.moverangecells.attachMovie("RangeCancelCell","cancelcell",100 * row + col);
   _parent._parent.cells.moverangecells.cancelcell.row = row;
   _parent._parent.cells.moverangecells.cancelcell.col = col;
   dbuffer = new Array(_parent._parent.ROWS);
   var i = 0;
   while(i < _parent._parent.ROWS)
   {
      dbuffer[i] = new Array(_parent._parent.COLS);
      i++;
   }
   showmovegrid(row,col,movedistance,"moverangecells","MoveRangeCell");
   delete dbuffer;
}
function showmovegrid(cellrow, cellcol, distance, frame, attachment)
{
   if(distance <= 0)
   {
      return undefined;
   }
   if(dbuffer[cellrow][cellcol] != undefined && dbuffer[cellrow][cellcol] >= distance)
   {
      return undefined;
   }
   if(_parent._parent.map[cellrow][cellcol] != -1 && _parent._parent.map[cellrow][cellcol].team != team)
   {
      return undefined;
   }
   dbuffer[cellrow][cellcol] = distance;
   var tempcell;
   var temppath = "_parent._parent.cells." + frame + ".";
   var temprow = new Array(cellrow,cellrow + 1,cellrow,cellrow - 1);
   var tempcol = new Array(cellcol + 1,cellcol,cellcol - 1,cellcol);
   var i = 0;
   while(i < 4)
   {
      tempcell = "cell" + temprow[i] + "x" + tempcol[i];
      if(_parent._parent.map[temprow[i]][tempcol[i]] == -1 && eval(temppath + tempcell) == null)
      {
         eval("_parent._parent.cells." + frame).attachMovie(attachment,tempcell,100 * temprow[i] + tempcol[i]);
         eval(temppath + tempcell).row = temprow[i];
         eval(temppath + tempcell).col = tempcol[i];
      }
      i++;
   }
   distance--;
   var i = 0;
   while(i < 4)
   {
      showmovegrid(temprow[i],tempcol[i],distance,frame,attachment);
      i++;
   }
}
function stand(facedirection)
{
   if(facedirection == undefined)
   {
      facedirection = direction;
   }
   switch(Math.abs(facedirection - direction))
   {
      case 0:
         sprite.gotoAndStop("Stand" + direction);
         gotoAndStop(3);
         break;
      case 2:
         sprite.gotoAndStop("WalkM" + (direction % 4 + 1));
         direction = facedirection;
         gotoAndPlay(3);
         break;
      default:
         direction = facedirection;
         gotoAndStop(5);
   }
}
function die()
{
   _parent._parent.map[row][col] = -1;
   unitcell.removeMovieClip();
   delete unitcell;
   attachMovie("Death","deathfx",99);
   gotoAndPlay(46);
}
function letpass(approachdirection, nextdirection)
{
   if(approachdirection < 1 || approachdirection > 4)
   {
      approachdirection = 0;
   }
   var temp = new Array(5);
   temp[approachdirection] = false;
   temp[(nextdirection + 1) % 4 + 1] = false;
   dodgedirection = direction;
   var i = 1;
   while(i <= 4)
   {
      if(temp[i] != false)
      {
         if(i == direction)
         {
            dodgedirection = i;
            break;
         }
         if(dodgedirection == direction)
         {
            dodgedirection = i;
         }
         else if(Math.abs(dodgedirection - direction) == 2)
         {
            dodgedirection = i;
         }
      }
      i++;
   }
   gotoAndPlay(27);
}
function attack(facedirection, targetrow, targetcol, targetarea)
{
   if(facedirection >= 1 && facedirection <= 4)
   {
      olddirection = direction;
      direction = facedirection;
   }
   if(targetrow == null || targetcol == null)
   {
      targetlist = new Array(targetarea.length);
      var i = 0;
      while(i < targetlist.length)
      {
         targetlist[i] = _parent._parent.map[targetarea[i].row][targetarea[i].col];
         if(targetlist[i] == -1)
         {
            if(showfxalways)
            {
               _parent.attachMovie("Blank","tempfx" + i,(targetarea[i].row + targetarea[i].col + 1) * 100 + 70 - targetarea[i].col);
               targetlist[i] = eval("_parent.tempfx" + i);
               targetlist[i]._x = _parent._parent.cell_x(targetarea[i].row,targetarea[i].col);
               targetlist[i]._y = _parent._parent.cell_y(targetarea[i].row,targetarea[i].col) + 22;
               targetlist[i].sprite = targetlist[i];
               targetlist[i].istempfx = true;
            }
            else
            {
               targetlist[i] = null;
            }
         }
         else if(targetlist[i] == -2)
         {
            targetlist[i] = null;
         }
         i++;
      }
   }
   else
   {
      targetlist = new Array(1);
      targetlist[0] = _parent._parent.map[targetrow][targetcol];
      if(targetlist[0] == -1)
      {
         if(showfxalways)
         {
            _parent.attachMovie("Blank","tempfx",(targetrow + targetcol + 1) * 100 + 70 - targetcol);
            targetlist[0] = _parent.tempfx;
            targetlist[0]._x = _parent._parent.coords.cell_x(targetrow,targetcol);
            targetlist[0]._y = _parent._parent.coords.cell_y(targetrow,targetcol) + 22;
            targetlist[0].sprite = targetlist[0];
            targetlist[0].istempfx = true;
         }
         else
         {
            targetlist[0] = null;
         }
      }
      else if(targetlist[0] == -2)
      {
         targetlist[0] = null;
      }
   }
   gotoAndPlay(19);
}
function movepath(newpath, freecell)
{
   if(newpath != undefined)
   {
      path = newpath;
   }
   if(path.length > 0)
   {
      if(freecell != false)
      {
         _parent._parent.map[row][col] = -1;
      }
      var newdirection = Number(path.charAt(0));
      path = path.substr(1);
      switch(newdirection)
      {
         case 1:
            col++;
            break;
         case 2:
            row++;
            break;
         case 3:
            col--;
            break;
         case 4:
            row--;
            break;
         default:
            return undefined;
      }
      if(Math.abs(newdirection - direction) == 2)
      {
         sprite.gotoAndStop("WalkM" + (direction % 4 + 1));
         direction = newdirection;
         gotoAndPlay(6);
      }
      else
      {
         direction = newdirection;
         gotoAndPlay(8);
      }
   }
}
function moveshift(shiftdirection)
{
   if(shiftdirection == undefined)
   {
      shiftdirection = direction;
   }
   switch(shiftdirection)
   {
      case 1:
         shadow._x = _X = _X + 11;
         shadow._y = _Y = _Y + 5.5;
         break;
      case 2:
         shadow._x = _X = _X - 11;
         shadow._y = _Y = _Y + 5.5;
         break;
      case 3:
         shadow._x = _X = _X - 11;
         shadow._y = _Y = _Y - 5.5;
         break;
      case 4:
         shadow._x = _X = _X + 11;
         shadow._y = _Y = _Y - 5.5;
   }
}
function setdepth(offset)
{
   if(offset == undefined)
   {
      offset = 0;
   }
   swapDepths((row + col + 1) * 100 + 70 - col * 2 + offset);
}
path = "";
if(unit != undefined && direction != undefined && row != undefined && col != undefined)
{
   if(!(direction >= 1 && direction <= 4))
   {
      direction = 1;
   }
   setdepth();
   _parent._parent.shadows.attachMovie("Shadow",_name,100 + _parent._parent.shadows.count++);
   shadow = eval("_parent._parent.shadows." + _name);
   shadow._x = _X = _parent._parent.cell_x(row,col);
   shadow._y = _Y = _parent._parent.cell_y(row,col);
   attachMovie(unit,"sprite",0);
   sprite._x = 0;
   sprite._y = 22;
   stand();
}
