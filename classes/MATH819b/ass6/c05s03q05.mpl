################
#5.3 Question 5#
################
with(PolynomialIdeals):

#PART A
LT:=f->Groebner[LeadingTerm](f, plex(x,y) )[2]:

I:=< y+x^2-1, x*y-2*y^2+2*y>;
GB:=Groebner[Basis](I,plex(x,y));

map(LT,GB);

#PART B

L:=[1,x,y,y^2];

for i in L do
    for j in L do
        T[i*j]:=Groebner[NormalForm]( i*j, GB, plex(x,y) );
    end do;
end do;

A:=array(1..5,1..5);
A[1,1]:=0:

for i from 2 to 5 do
    A[1,i]:=L[i-1];
    A[i,1]:=L[i-1];
    for j from 2 to 5 do
        ind:=L[i-1]*L[j-1];
        A[i,j]:=T[ind];
    end do:
end do:

print(A);

IsMaximal(I);
#This means by Thm 8 that the quotient Ring can not be a field.

#EXTRA
f:=1+y;
finv:=a+b*x+c*y+d*y^2;

zero:=Groebner[NormalForm](f*finv,GB,plex(x,y))-1;

sol:=solve( {coeffs(zero,[x,y])} );

finv:=eval( finv, sol);

#Checking this solution we see that
Groebner[NormalForm](f*finv,GB,plex(x,y));

quit: