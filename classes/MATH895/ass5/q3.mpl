#interface(quiet=true):
read "GE.mpl":

read "systems/sys49.txt":
Dimensions(A)[1];
st:=time():
interface(quiet=true):
x:=GE(A,b,M):
interface(quiet=false):
time()-st;
convert(map(rem,A.x-b,M,e),set);

read "systems/sys100.txt":
Dimensions(A)[1];
st:=time():
interface(quiet=true):
x:=GE(A,b,M):
interface(quiet=false):
time()-st;
convert(map(rem,A.x-b,M,e),set);

read "systems/sys196.txt":
Dimensions(A)[1];
st:=time():
interface(quiet=true):
x:=GE(A,b,M):
interface(quiet=false):
time()-st;
convert(map(rem,A.x-b,M,e),set);