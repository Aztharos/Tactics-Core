var tempallystat = eval("_parent._parent._parent.allystats." + _parent.name);
var tempcnt = _parent.cnt;
_parent._parent._parent.copyunit(0,10);
_parent.cnt = tempcnt;
tempallystat.pic.gotoAndStop(_parent.unit);
_parent._parent._parent.calcqueue();
_parent._parent._parent.showqueue();
_parent._parent._parent.allystats._visible = _parent._parent._parent.queue._visible = _parent._parent._parent.activestats._visible = _parent._parent._parent.targetstats._visible = true;
_parent._parent._parent.endaction();
removeMovieClip(this);
