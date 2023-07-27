#interface(quiet=true):
read "zipp.mpl":

var:=[x,y,z]:
t:=op(var):
A:=(x,y,z)->x^5+2*y*z*x^4+(13*y*z^2-21*y^3*z+3)*x^3+(26*y^2*z^3-42*y^4*z^2+2)*x^2+(39*y*z^2-63*y^3*z+4*y*z)*x+6:

B:=(x,y,z)->x^6+(13*y*z^2-21*y^3*z+z+y)*x^4+3*x^3+(13*y*z^3+13*y^2*z^2-21*y^3*z^2-21*y^4*z)*x^2+(13*y*z^2-21*y^3*z+2*z+2*y)*x+2:

a:=A(t): b:=B(t):

print("ANSWER");
Gcd(a,b) mod 11;

print("FACTORED"):
Factor(a) mod 11; Factor(b) mod 11;

print("LC");
lcoeff(a,x); lcoeff(b,x);

print("GCD's"):
#Reject 
Gs:=[
Gcd( A(x,1,1), B(x,1,1) ) mod 11,
Gcd( A(x,2,1), B(x,2,1) ) mod 11,
Gcd( A(x,3,1), B(x,3,1) ) mod 11,
Gcd( A(x,4,1), B(x,4,1) ) mod 11,
Gcd( A(x,6,1), B(x,6,1) ) mod 11 ];
Pts:=[1,2,3,4,6];

Chk:=Interp(Pts,Gs,y) mod 11:
collect(Chk,x);
Gcd(A(x,y,1), B(x,y,1)) mod 11;

Gf,Ind:=AssForm(Chk,x,[y,z]);
print(Gf);

g1:=Gcd( A(x,1,2), B(x,1,2) ) mod 11;
g2:=Gcd( A(x,3,2), B(x,3,2) ) mod 11;

Gf[x];

AA:=[subs(y=1,Gf[x]),subs(y=3,Gf[x])] mod 11;
AA:=Matrix(AA);

BB:=[[10],[1]]: BB:=Matrix(BB);

with(LinearAlgebra):
LinearSolve(AA,BB) mod 11;


Gf[1];
Gf[x^3];
Gf[x];

a:=2+x^3+(2*y^3+8*y)*x:
#MAKE SURE GCDS ARE MONIC
b:=1/6 * Gcd(A(x,y,2), B(x,y,2)) mod 11;

collect(a,x);
collect(b,x);

