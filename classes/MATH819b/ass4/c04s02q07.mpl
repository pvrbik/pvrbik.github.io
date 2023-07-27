#4.2 Question 7
with(Groebner):

#(A)

f:=x+y;

g0:=x^3;
g1:=y^3;
g2:=x*y*(x+y);

#We use Prop 8 to determine if f \in Rad(<g0,g1,g2>) by seeing if 1 is in :

G:=Basis([g0,g1,g2,1-t*f],plex(t,x,y,z));

#which it is so f \in Rad(<g0,g1,g2>). For lowest power we do:

NormalForm(f,[g0,g1,g2],plex(x,y));
NormalForm(f^2,[g0,g1,g2],plex(x,y));
NormalForm(f^3,[g0,g1,g2],plex(x,y));

#So f^3 is the smallest power of f that belongs to the ideal.

#(B)

f:=x^2+3*x*z;

g0:=x+z;
g1:=x^2*y;
g2:=x-z^2;

#Again using Prop 8 we do

G:=Basis([g0,g1,g2,1-t*f],plex(t,x,y,z));

#and so we can conlude that 1 \nin G so f \nin Rad(<g0,g1,g2>).
#Note: \nin is LaTex not included in.

quit: