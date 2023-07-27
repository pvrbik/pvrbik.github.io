interface(quiet=true):

read "common.mpl":
read "BBA.mpl":
read "elim.mpl":

SHOW:=proc(inG,LT)
local G:
    G:=convert(inG,list):
    printf("        LT(G)=%a\n",sort(map(LT,G))):
end proc:

###########
#Problem 2#
###########

var:=[x,y,z]:
f1:= 4*x^2 + x*y^2 - z +1/3;
f2:= 2*x + y^2*z + 1/2;
f3:= x^2*z - 1/2*x - y^2;

G:=[f1,f2,f3]:

#LEX ORDER
ord:=plex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(G,LT):
SHOW(G,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);

#GRADED ORDER
ord:=grlex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(G,LT):
SHOW(G,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);

#GRADED ORDER
ord:=tdeg(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(G,LT):
SHOW(G,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);

###########
#Problem 3#
###########

var:=[u0,u1,u2,u3]:
f1:= u0^2 - u0 + 2*u1^2 + 2*u2^2 + 2*u3^2;
f2:= 2*u0*u1 + 2*u1*u2 + 2*u2*u3 - u1;
f3:= 2*u0*u2 + u1^2 + 2*u1*u3 - u2;
f4:= u0 + 2*u1 + 2*u2 + 2*u3 -1;

I:=[f1,f2,f3,f4]:

#LEX ORDER
ord:=plex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(I,LT):
SHOW(G,LT);

chk:=Groebner:-Basis(I,ord):
SHOW(chk,LT);

#GRADED ORDER
ord:=grlex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(I,LT):
SHOW(G,LT);

chk:=Groebner:-Basis(I,ord):
SHOW(chk,LT);

#TOTAL DEG
ord:=tdeg(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(I,LT):
SHOW(G,LT);

chk:=Groebner:-Basis(I,ord):
SHOW(chk,LT);

quit:
###########
#Problem 5#
###########
#PART A#
########
varX:=[t,u]:
varY:=[x,y,z]:

I:=[x-t-u, y-t^2-2*t*u, z-t^3-3*t^2*u];
LT:=f->LTelim( f ,varX,varY);

G:=convert(BBA(I,LT),list):
map(indets,G);
G[5];

G:=Groebner[Basis](I,plex( op(varX), op(varY)) ):
map( indets, G);
G[1];

########
#PART B#
########

varX:=[t];
varY:=[x,y,z]:

I:=[ t^2+x^2+y^2+z^2, t^2+2*x^2-x*y-z^2, t+y^3-z^2 ];
LT:=f->LTelim( f ,varX,varY);

G:=convert(BBA(I,LT),list):
map(indets,G);
eqns:={G[1],G[3]};

G:=Groebner[Basis](I,plex( op(varX), op(varY)) ):
map( indets, G);
G[1];G[2];G[3];G[4];

quit:
