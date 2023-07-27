#Chapter 2 Section 8 Question 1
#interface(quiet=true):

with(Groebner):
f:=x*y^3-z^2+y^5-z^3;
II:=[-x^3+y, x^2*y-z];
G:=Basis(II,plex(z,y,x));
NormalForm(f,G,plex(z,y,x));
#Which by Cor 2 of Sec 2.6 implies that f \in II.

#I would choose plex (lexical ordering) with z>y>x
#because LT(II) = { y , z } on this ordering. 
#This means that our remainders will be small since they can only
#be polynomials in x alone. Since these remainders are being put into
#the intermediate basis, keeping them small is a good optimization.

quit;
