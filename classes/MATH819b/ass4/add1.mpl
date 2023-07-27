#Additonal Question 1

#(A)

f:=x^2+2*y^2-3;
g:=x^2+x*y+y^2;

R:=resultant(f,g,x);

#(B)

G:=Groebner[Basis]([f,g],plex(x,y));
map(indets,G);

G[1];

#Since 3*G[1] = R. R indeed genetates I \int Q[y]. That is <R>=I \in Q[y].

#(C)
gcdex(f,g,x,'s','t');
s;t;

#and it should be the case that s*f + t*g = 1. Lets check (cause you never know with maple):
simplify(s*f+t*g);

#Notice that the following are all equal.
denom(s); denom(t); factor(R);

#This means that multiplying s*f + t*g = 1 by R will give the desired result. That is
A:=simplify(s*R);
B:=simplify(t*R);

#where

simplify( A*f + B*g ) = R;

quit:
