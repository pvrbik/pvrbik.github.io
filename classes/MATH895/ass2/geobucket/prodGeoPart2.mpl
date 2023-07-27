#interface(quiet=true):
read "geoDivision.mpl":
read "../DatPart2.mpl":

print("GEO"):
macro(D=DD):
nops(a),nops(A),nops(b),nops(B),nops(c),nops(C),nops(d),nops(D);
var;
print("DIVIDE(D,A)"):
st:=time():
N:=0;
(Q,R):=GEOdiv(D,A,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

print("DIVIDE(D,B)"):
st:=time():
N:=0;
(Q,R):=GEOdiv(D,B,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

print("DIVIDE(D,C)"):
st:=time():
N:=0;
(Q,R):=GEOdiv(D,C,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

quit: