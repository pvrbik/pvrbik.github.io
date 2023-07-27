#Additional Question 7

with(Groebner):
with(PolynomialIdeals):

I:=<x^2-y, y^4-y*z^2, x*y^3-x*z^2 >;
IsRadical(I);

G:=Basis(I, plex(x,y,z) );
factor(G);

P1 := Quotient(I,<x>);
P2 := Quotient(I,<y^3-z^2>);

IsPrime(P1); IsPrime(P2);

#P1 gives x^2=y which subbing into y^3=z^2 gives
f:=x^6-z^2;
factor(f);

P3 := Quotient(P1,<x^3-z>);
P4 := Quotient(P1,<x^3+z>);

IsPrime(P3); IsPrime(P4);

#So the prime decomposition should be P2 \int P3 \int P4. Check:
P2,P3,P4;
Simplify(PrimeDecomposition(I));

#Now we'll check irredundancy.
IC:=IdealContainment:

IC(P2,P3); IC(P3,P2);
IC(P2,P4); IC(P4,P2);
IC(P3,P4); IC(P4,P3);


#So the decompositon is irredundant.
quit: