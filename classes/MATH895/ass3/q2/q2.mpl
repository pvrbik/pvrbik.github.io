interface(quiet=true):
read "ZMGCD.mpl":
read "MGCD.mpl":
`mod`:=mods:

var:=[x,u,v,w,y,z]:

g:=2*x^8 + (u^8*v - 3*v^8*y + y^8*u)*x^4 + (w^8*z - 3*z^8*w + 1):
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
 