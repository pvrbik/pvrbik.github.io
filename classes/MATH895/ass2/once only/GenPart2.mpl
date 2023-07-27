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
