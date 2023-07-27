interface(quiet=true):
read "ZMGCD.mpl":
read "MGCD.mpl":
`mod`:=mods:

var:=[x,u,v,w,y,z]:

g:=2*x^8 + (u^8*v - 3*v^8*y + y^8*u)*x^4 + (w^8*z - 3*z^8*w + 1):c:=4*x^8 + 5*w^4*x^4 + 2*y^4*z^4 + 3*u^4*v^4 + 1:d:=6*x^8 - 5*y^4*x^4 - 4*u^4*v^4 - 3*w^4*z^4 - 2:A:=expand(g*c):
B:=expand(g*d):

#SPARSE
#trace(ZMGCD);

count:=0:
ZMGCD(A,B,var);
count;

gcd(A,B);

quit:

#DENSE
count:=0:
MGCD(A,B,var);
count;

#CHECK
gcd(A,B);

quit:
 