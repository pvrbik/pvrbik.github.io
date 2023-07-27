read "common.mpl":
read "FGLM.mpl":
read "new.mpl":

var:=[x,y,z];

Bred,xbar:=[1, z, z^2, z^3, 2+y-2*z-2*z^2+4*y*z+3*z^3], 2+5*y*z+3*y+7*z^3-4*z;

AddB(Bred,xbar);

trace(AddB2);
AddB2(Bred,xbar);

quit: