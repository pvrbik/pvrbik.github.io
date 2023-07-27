#interface(quiet=true):
read "heapDivision.mpl":
read "../DatPart2.mpl":

print("HEAP"):
macro(D=DD):
nops(a),nops(A),nops(b),nops(B),nops(c),nops(C),nops(d),nops(D);

print("DIVIDE(D,A)"):
st:=time():
N:=0;
(Q,R):=HeapDiv(D,A,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

restart():
read "heapDivision.mpl":
read "../DatPart2.mpl":
macro(D=DD):
print("DIVIDE(D,B)"):
st:=time():
N:=0;
(Q,R):=HeapDiv(D,B,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

restart:
read "heapDivision.mpl":
read "../DatPart2.mpl":
macro(D=DD):
print("DIVIDE(D,C)"):
st:=time():
N:=0;
(Q,R):=HeapDiv(D,C,var): R;
t:=time()-st;
print(N,M,evalf(N/M)):

quit: