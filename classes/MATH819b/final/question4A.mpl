##############
#Question 4 A#
##############

with(Groebner):

f1:=x^3+y+z-1;
f2:=x+y^3+z-1;
f3:=x+y+z^3-1;

I:=[f1,f2,f3];

G:=Basis(I,plex(x,y,z)):
map(indets,G);

#I_1 = I \intersect Q[z] = <G[1]> where
factor(G[1]);
#We can see from this factoriazion that the only rational roots will be
#z = 0, 1, -1. 

#I_2 = I \intersect Q[z] = <G[1],G[2],G[3],G[4]> where
G[2];
G[3];
G[4];

#CASE z=0:
eqns:=eval( [G[2],G[3],G[4]], z=0 );
factor( eqns );
#We can see from this factoriazion that the only solutions will be
#y = 0,1

#The only element of basis in three variables is G[5]
#CASE z=0 y=0
f:=eval(G[5],{z=0,y=0});
#So x = 1 and we get that (1,0,0) \in V(I)

#CASE z=0 y=1
f:=eval(G[5],{z=0,y=1});
#So x = 0 and we get that (0,1,0) \in V(I)


#CASE z=1:
eqns:=eval( [G[2],G[3],G[4]], z=1 );
factor( eqns );
#We can see from this factoriazion that the only solutions will be
#y = 0,1,-1

#CASE z=1 y=0
f:=eval(G[5],{z=1,y=0});
#So x = 0 and we get that (0,0,1) \in V(I)

#CASE z=1 y=1
f:=eval(G[5],{z=1,y=1});
#So x = -1 and we get that (-1,1,1) \in V(I)

#CASE z=1 y=-1
f:=eval(G[5],{z=1,y=-1});
#So x = 1 and we get that (1,-1,1) \in V(I)

#CASE z=-1:
eqns:=eval( [G[2],G[3],G[4]], z=-1 );
factor( map(primpart,eqns) );
#We can see from this factorization that the only solution is y=1

#CASE z=-1 y=1
f:=eval(G[5],{z=-1,y=1});
#So x = 1 and we get that (1,1,-1) \in V(I)

#Therefore V(I) = { (1,0,0),(0,1,0),(0,0,1),(-1,1,1),(1,-1,1),(1,1-1) } 

quit:
