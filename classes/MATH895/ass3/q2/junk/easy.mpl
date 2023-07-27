interface(quiet=true):
read "SprInterp.mpl":
read "zipp.mpl":

#`mod`:=mods:

p:=11:
var:=[x,y,z]:

A:=x^5+2*y*z*x^4+(13*y*z^2-21*y^3*z+3)*x^3+(26*y^2*z^3-42*y^4*z^2+2)*x^2+(39*y*z^2-63*y^3*z+4*y*z)*x+6:

B:=x^6+(13*y*z^2-21*y^3*z+z+y)*x^4+3*x^3+(13*y*z^3+13*y^2*z^2-21*y^3*z^2-21*y^4*z)*x^2+(13*y*z^2-21*y^3*z+2*z+2*y)*x+2:


chk:=2+x^3+(y^3+2*y)*x;
#chk:=2+x^3;
Gf,Ind:=AssForm(chk,[x,y,z]);
print(Gf);

az:=eval(A,z=2):
bz:=eval(B,z=2):

trace(sprInterp);
sprInterp(az,bz,Gf,Ind,p,var[1..-2]);
Mgcd(az,bz,p,[x]);