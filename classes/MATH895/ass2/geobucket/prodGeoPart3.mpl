#interface(quiet=true):
read "geoDivision.mpl":
read "../DatPart3.mpl":

print("GEO"):

nops(a),nops(A),nops(c),nops(C);

print("DIVIDE(C,A)"):
st:=time():
N:=0;
(Q,R):=GEOdiv(C,A,var):
t:=time()-st;

print(N,M,evalf(N/M)):

q:=SMP2Maple(Q,var):
r:=SMP2Maple(R,var):
expand(c-q*a-r);

quit: