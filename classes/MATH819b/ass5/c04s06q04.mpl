#4.6 Question 4

#(A)

with(Groebner):
with(PolynomialIdeals):

I:=<x*z-y^2,x^3-y*z>;
J:=<x^2*y-z^2>;
K:=Intersect(I,J);

map(f->simplify(f/(x^2*y-z^2)),K);

#(C)

Intersect( <x,y> , <x*z-y^2,x^3-y*z,z^2-x^2*y> );
Simplify(I);
#So they are indeed equal.

quit:
