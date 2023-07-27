interface(quiet=true):
read "geoDivision.mpl":
#read "../smallfuncs.mpl":
read "../funcs.mpl":

print("GEOBUCKETS"):

nops(a),nops(A),nops(b),nops(B),nops(c),nops(C);
var:=[u,v,w,x,y,z]:

print("DIVIDE(C,A)"):
N:=0:
st:=time():
    N:=0:
    (Q,R):=GEOdiv(C,A,var):
    print("timing"):
t:=time()-st;

print("correctness");
evalb(Q=B); R;
print(N,M,evalf(N/M)):

print("DIVIDE(C,B)"):
N:=0:
st:=time():
    N:=0:
    (Q,R):=GEOdiv(C,B,var):
    print("timing"):
t:=time()-st;

print("correctness");
evalb(Q=A); R;
print(N,M,evalf(N/M)):