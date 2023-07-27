interface(quiet=true):
read "padic.mpl":

with(LinearAlgebra): 
B:=2^16; m := 3; 

#parti
U:=rand(B^m):
A:=RandomMatrix(50,50,generator=U):
b:=RandomVector(50,generator=U):

st:=time():
x:=padicLinearSolve(A,b):
time()-st;

st:=time():
LinearSolve(A,b):
time()-st;

convert( A.x-b, set ); # should be {0} 

#partii
y:=[1,0,-1/2,2/3,4,3/4,-2,-3,0,-1]:
x:=Vector( [seq( op(y), i=1..5 )] ):
b:=A.x:
b:=12*b:
A:=12*A: # clear fractions 

st:=time():
x:=padicLinearSolve(A,b):
time()-st;

st:=time():
LinearSolve(A,b):
time()-st;

convert(A.x-b, set ); # should be {0} 
quit;
