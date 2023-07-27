#interface(quiet=true):
read "PGCD.mpl":

X := [x,y,z]:
azcont := (z-1):
bzcont := (z-1)*(z^2-z+1):
c := x^3+y^3+z^3+1; d := x^3-y^3-z^3+1:
g := x^4-123454321*y*z^2*x^2+1:
a := expand(azcont*c*g): b := expand(bzcont*d*g):

PGCD(a,b,13,var);
PGCD(a,b,13,var);