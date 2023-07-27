#interface(quiet=true):
read "merge_division.mpl":
read "../DatPart1.mpl":

print("MERGE"):
nops(a),nops(A),nops(b),nops(B),nops(c),nops(C);

print("DIVIDE(C,A)"):
st:=time():
N:=0;
(Q,R):=SMPdiv(C,A,var):
t:=time()-st;
evalb(Q=B); R;
print(N,M,evalf(N/M)):

print("DIVIDE(C,B)"):
N:=0:
st:=time():
N:=0:
(Q,R):=SMPdiv(C,B,var):
t:=time()-st;
evalb(Q=A); R;
print(N,M,evalf(N/M)):

quit: