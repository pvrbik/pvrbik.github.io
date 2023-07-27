interface(quiet=true):
read "SDMP.mpl":

N:=0:
var:=[u,v,w,x,y,z]:
a:=randpoly(var,degree=10,terms=5000):
b:=randpoly(var,degree=5,terms=5):
c:=expand(a*b):

nops(a), nops(b), nops(c);

A:=Maple2Smp(a,var):
B:=Maple2Smp(b,var):
C:=Maple2Smp(c,var):

nops(A), nops(B), nops(C);

save var,a,b,c,A,B,C,"DatPart1.mpl":
