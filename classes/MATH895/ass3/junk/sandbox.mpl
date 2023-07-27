interface(quiet=true):
read "PGCD.mpl":
#read "MGCD.mpl":
#read "sulingMGCD.mpl":

p:=11:
#p:=nextprime(1000);
var:=[x,y,z]:
#A:=2*3*(x+1)*(x+2)*(y+1)*(y+2)*(z+1)^2:
#B:=2*9*(x+1)*(y+2)*(z+1):

#var:=[u,v,w,x,y,z]:
var:=[u,x,y,z]:
g:=randpoly(var):
A:=randpoly(var)*g:
B:=randpoly(var)*g:
A:=Expand(A) mod p:
B:=Expand(B) mod p:

t1:=Gcd(A,B) mod p;
t1:=factor(t1);
#t2:=lazyPGCD(A,B,p);
#trace(MGCD);
t2:=PGCD(A,B,p,var);
t2:=factor(t2);

Expand(t1-t2) mod p;
