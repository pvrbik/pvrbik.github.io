#interface(quiet=true):
read "PGCD.mpl":
read "badPGCD.mpl":

p:=7:
var:=[x,y,z]:

g:=x^3+z*y^4+5*y^4+2:
a:=g*(x-y):
b:=g*(x+y):

Gcd(a,b) mod p;
PGCD(a,b,p,var);

a:=g*(x-y):
b:=g*(x+y):

expand(a); expand(b);

badPGCD(a,b,p,var);