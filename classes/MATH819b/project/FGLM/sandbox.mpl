interface(quiet=true):
read "common.mpl":
read "FGLM.mpl":

var:=[b,s,w,z,t,p]:
#var:=[x,y,z];

ord:=plex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):
#LT:=f->(Groebner[LeadingTerm](f,ord))[2]:

f1:=45*p + 35*s - 165*b - 36:
f2:=35*p + 40*z + 25*t - 27*s:
f3:=15*w + 25*p*s + 30*z - 18*t - 165*b^2:
f4:=-9*w + 15*p*t + 20*z*s:
f5:=w*p + 2*z*t - 11*b^3:
f6:=99*w - 11*s*b + 3*b^2:

#I:=[x*y+y^2+z,x^2+z^2,x^2+y+z];
#I:=[x*y+z-x*z, x^2-z, 2*x^3-x^2*y*z-1 ];
#I:=[ x-t-u, y-t^2-2*t*u, z-t^3-3*t^2*u ];

I:=[f1,f2,f3,f4,f5,f6];

Ggrd:=Groebner[Basis](I,grlex(op(var))):

#trace(FGLM);
G:=FGLM( Ggrd, grlex(op(var)) ):
Glex:=Groebner[Basis](I,plex(op(var))):

map(LT,G);
map(LT,Glex);

quit:
