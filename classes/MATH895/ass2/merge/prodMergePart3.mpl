#interface(quiet=true):
read "merge_division.mpl":
read "../DatPart3.mpl":

print("MERGE"):

nops(a),nops(A),nops(c),nops(C);

print("DIVIDE(C,A)"):
N:=0:
st:=time():
(Q,R):=SMPdiv(C,A,var):
t:=time()-st;

print(N,M,evalf(N/M)):

q:=SMP2Maple(Q,var):
r:=SMP2Maple(R,var):
expand(c-q*a-r);

quit: