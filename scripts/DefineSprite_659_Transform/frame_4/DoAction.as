_parent._x += DX;
_parent._y += DY;
_X = _X - DX;
_Y = _Y - DY;
glow.rb = glowr * 3 / 4;
glow.gb = glowg * 3 / 4;
glow.bb = glowb * 3 / 4;
spritecolor.setTransform(glow);
