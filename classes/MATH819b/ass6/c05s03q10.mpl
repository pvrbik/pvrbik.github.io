#################
#5.3 Question 10#
#################
with(Groebner):

#PART B

I:=[y1^2-2, y2^2-3];
#Notice that this is a GB for any ordering we choose.
GB:=Basis( I, plex(y1,y2) );

L:=[1,y1,y2,y1*y2];

for i in L do
    for j in L do
        T[i*j]:=Groebner[NormalForm]( i*j, GB, plex(y1,y2) );
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

#PART C
f:=x+y1+y2;
finv:= a1*L[1]+a2*L[2]+a3*L[3]+a4*L[4];

zero:=NormalForm( f*finv, GB, plex(y1,y2) ) - 1;
sol:=solve( {coeffs(zero,[y1,y2])} );

#So the inverse is:
finv:=simplify(eval(finv,sol));

#Check
NormalForm( f*finv, GB, plex(y1,y2) );

quit: