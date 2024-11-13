_parent._x += DX;
_parent._y += DY;
_X = _X - DX;
_Y = _Y - DY;
glow.rb = glowr * 2 / 3;
glow.gb = glowg * 2 / 3;
glow.bb = glowb * 2 / 3;
spritecolor.setTransform(glow);
