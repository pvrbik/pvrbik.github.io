#interface(quiet=true):
read "heapDivision.mpl":
read "../DatPart3.mpl":

print("HEAP"):

nops(a),nops(A),nops(c),nops(C);

print("DIVIDE(C,A)"):
N:=0:
st:=time():
N:=0;
(Q,R):=HeapDiv(C,A,var):
t:=time()-st;

print(N,M,evalf(N/M)):

q:=SMP2Maple(Q,var):
r:=SMP2Maple(R,var):
expand(c-q*a-r);

quit: