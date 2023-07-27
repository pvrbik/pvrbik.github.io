#Additional 6

with(Groebner):
with(PolynomialIdeals):

I:=<y*x-x^3,z-x^3>;
G:=Basis(I,plex(x,y,z));
factor(G);

fs := { seq( f=0, f in G ) }:
solve(fs);
#Notice that the second is the parameterization of twisted cubic!

J:=<x,z>;
K:=<y-x^2,z-x^3>;
Simplify(K);

Quotient(I,K);
#which is indeed equal to J
Quotient(I,J);
#which is indeed equal to K

quit:
