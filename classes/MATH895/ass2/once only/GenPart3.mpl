interface(quiet=true):
read "SDMP.mpl":

var:=[x,y]:

c:=proc() randpoly(y,dense,degree=10) end:
a:=add( c()*x^i, i=0..19): A:=Maple2Smp(a,var):
b:=add( c()*x^i, i=0..19):
c:=collect(a*b, x, expand): C:=Maple2Smp(c,var):

nops(A), nops(C);

save var,a,b,c,A,C,"DatPart3.mpl":
