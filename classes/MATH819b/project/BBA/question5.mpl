read "common.mpl":
read "BBA.mpl":
read "elim.mpl":

###########
#Problem 5#
###########
#PART A#
########
varX:=[t,u]:
varY:=[x,y,z]:

I:=[x-t-u, y-t^2-2*t*u, z-t^3-3*t^2*u];
LT:=f->LTelim( f ,varX,varY);

myG:=BBA(I,LT);

G:=Groebner[Basis](I,lexdeg( varX, varY ) ):
G:=convert(G,set);

G:=convert(BBA(I,LT),list);
map(indets,G);
G[5];

G:=Groebner[Basis](I,plex( op(varX), op(varY)) );
map( indets, G);
G[1];

########
#PART B#
########

varX:=[t];
varY:=[x,y,z]:

I:=[ t^2+x^2+y^2+z^2, t^2+2*x^2-x*y-z^2, t+y^3-z^2 ];
LT:=f->LTelim( f ,varX,varY);

G:=convert(BBA(I,LT),list);
map(indets,G);
eqns:={G[1],G[3]};

G:=Groebner[Basis](I,plex( op(varX), op(varY)) );
map( indets, G);
G[1];G[2];G[3];G[4];

quit:
