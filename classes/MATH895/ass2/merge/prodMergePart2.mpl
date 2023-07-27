#interface(quiet=true):
read "merge_division.mpl":
read "../DatPart2.mpl":

print("MERGE"):
macro(D=DD):
nops(a),nops(A),nops(b),nops(B),nops(c),nops(C),nops(d),nops(D);

print("DIVIDE(D,A)"):
st:=time():
N:=0;
(Q,R):=SMPdiv(D,A,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

print("DIVIDE(D,B)"):
st:=time():
N:=0;
(Q,R):=SMPdiv(D,B,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

print("DIVIDE(D,C)"):
st:=time():
N:=0;
(Q,R):=SMPdiv(D,C,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

quit: