#interface(quiet=true):
read "MGE.mpl":

read "systems/sys49.txt":
k:=5:

st:=time():
interface(quiet=true):
x:=MGE(A,b,M,k):
interface(quiet=false):
time()-st;

c:=map(rem,(A.x-b),M,e):
convert(c,set);

read "systems/sys100.txt":
k:=24:

st:=time():
interface(quiet=true):
x:=MGE(A,b,M,k):
interface(quiet=false):
time()-st;

c:=map(rem,(A.x-b),M,e):
convert(c,set);

read "systems/sys196.txt":
k:=3:

st:=time():
interface(quiet=true):
x:=MGE(A,b,M,k):
interface(quiet=false):
time()-st;

c:=map(rem,(A.x-b),M,e):
convert(c,set);


quit:
#A:=Matrix([[2/3*e+1/2*e,3/2*e+1],[2*e+2/3,5/2]]);
#b:=Vector([1,1]);
k:=3;
m:=numtheory[cyclotomic](k,e);
m:=M;

#trace(MGE);
x:=MGE(A,b,m,k);

c:=map(rem,(A.x-b),m,e);

convert(c,set);
