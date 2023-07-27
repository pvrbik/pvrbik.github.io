interface(quiet=true):
read "heapDivision.mpl":
#read "../debug.mpl":
#read "../smallfuncs.mpl":
read "../funcs.mpl":

print("HEAPS"):

nops(a),nops(A),nops(b),nops(B),nops(c),nops(C);
var:=[u,v,w,x,y,z]:
#var:=[x,y];

print("DIVIDE(C,A)"):
st:=time():
    N:=0:
    (Q,R):=HeapDiv(C,A,var):
    print("timing"):
t:=time()-st;

print("correctness");
evalb(Q=B); R;
#SMP2Maple(R,var);
print(N,M,evalf(N/M)):

print("DIVIDE(C,B)"):
restart():
read "../funcs.mpl":

st:=time():
    N:=0:
    (Q,R):=HeapDiv(C,B,var):
    print("timing"):
t:=time()-st;

print("correctness");
evalb(Q=A); R;
print(N,M,evalf(N/M)):