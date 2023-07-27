#Chapter 3 Section 1 Question 7
#interface(quiet=true):

with(Groebner):

II:=[ t^2+x^2+y^2+z^2, t^2+2*x^2-x*y-z^2, t+y^3-z^3 ];

#(a)
GBlex:=Basis(II,plex(t,x,y,z));
#The only term that has t in it is the last so

G1:=GBlex[1..-2];
#Is the basis for I \intersect k[x,y,z]

map(degree,G1);
#there is a term of total degree 12 as the book says.

#(b)
GB:=Basis(G1,tdeg(x,y,z));
#is the GB wrt to grevlex for G1 \intersect k[x,y,z]

#(c)
GB:=[op(GB),t+y^3-z^3]:
#The proof that this is in fact a GB for I wrt to the L-elim order
#is on the next page.

CHECK:=Basis(II,lexdeg([t],[x,y,z]));

{op(GB)} minus {op(CHECK)};
#So this checks.


quit:
