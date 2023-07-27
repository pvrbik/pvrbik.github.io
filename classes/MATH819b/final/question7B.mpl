#############
#Question 7B#
#############
with(PolynomialIdeals):
with(Groebner):

f1:=x^2+y+z-1;
f2:=x+y^2+z-1;
f3:=x+y+z^2-1;

#First we will computer the radical of I

I:=<f1,f2,f3>;
IsRadical(I);

G:=factor(Basis(I,plex(x,y,z)));
#I will try my luck and throw the square-free part of G[1] into I

#the square-free part of G[1] is
f4:=z*(z^2+2*z-1)*(z-1);

I:=<f1,f2,f3,f4>;
IsRadical(I);

#Now that we have that I is radical we can proceed 
G:=factor(Basis(I,plex(x,y,z)));

f:=G[1];

#Now we will split I into three components corresponding to the three factors of f
P1:=Basis(<I,z>,plex(x,y,z));
P2:=Basis(<I,z-1>,plex(x,y,z));
P3:=Basis(<I,z^2+2*z-1>,plex(x,y,z));

P1:=<op(P1)>: P2:=<op(P2)>: P3:=<op(P3)>:
IsPrime(P1); IsPrime(P2); IsPrime(P3);

G:=factor(Basis(P1,plex(x,y,z)));
P4:=Basis(<P1,y>,plex(x,y,z));
P5:=Basis(<P1,y-1>,plex(x,y,z));

P4:=<op(P4)>: P5:=<op(P5)>:

IsPrime(P4); IsPrime(P5);

#This means the prime decomposition of rad(I) is into the following:
P2;P3;P4;P5;

#CHECK#
ans:=Radical(I):
Simplify(PrimeDecomposition(ans));

quit: