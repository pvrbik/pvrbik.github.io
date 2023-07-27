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


interface(quiet=true):
read "SDMP.mpl":

macro(D=DD):
var:=[u,v,w,x,y,z]:
for i to 4 do f[i]:=randpoly(var,degree=5,terms=20); od:
a:=expand(f[1]): A:=Maple2Smp(a,var):
b:=expand(a*f[2]): B:=Maple2Smp(b,var):
c:=expand(b*f[3]): C:=Maple2Smp(c,var):
d:=expand(c*f[4]): D:=Maple2Smp(d,var):

nops(a), nops(b), nops(c), nops(D);
nops(A), nops(B), nops(C), nops(D);

save var,a,b,c,d,A,B,C,D,"DatPart2.mpl":


interface(quiet=true):
read "SDMP.mpl":

var:=[x,y]:

c:=proc() randpoly(y,dense,degree=10) end:
a:=add( c()*x^i, i=0..19): A:=Maple2Smp(a,var):
b:=add( c()*x^i, i=0..19):
c:=collect(a*b, x, expand): C:=Maple2Smp(c,var):

nops(A), nops(C);

save var,a,b,c,A,C,"DatPart3.mpl":
