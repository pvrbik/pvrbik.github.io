#3.6 Question 6

#(b)

f:=x->x^5-2*x^3-2*x^2+4;
g:=x->x^5+5*x^4+8*x^3+2*x^2-5*x+1;

h:=resultant(f(x),g(y+x),x):
factor(h);

roots(h,y);

#Since there is a integer root of multiplicity 5 there must be roots of f and g that differ by an ingetger.

#And we can check this:

sf:=solve(f(x)=0);
sg:=solve(g(x)=0);

seq(expand(sf[i]-sg[i]), i=1..nops([sf]) );

#So indeed the 5 roots differ by an integer.
