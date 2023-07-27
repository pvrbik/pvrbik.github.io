#Chapter 2 Section 8 Question 5
#interface(quiet=true):

with(Groebner):
f:=(x^2+y^2-4)*(x^2+y^2-1)+(x-3/2)^2+(y-3/2)^2;

fx:=expand(diff(f,x));

fy:=expand(diff(f,y));

G:=Basis([fx,fy],grlex(x,y));

ys:=[solve(G[2]=0)];

#Since we have that x=y from G[1] of the GB we have these solutions:
Solns:=seq( [ ys[i], ys[i] ], i=1..3 );

#Check

for S in Solns do
    c1:=expand(eval( fx, {x=S[1], y=S[2]}));
    c2:=expand(eval( fy, {x=S[1], y=S[2]}));
    printf("%d %d \n", c1, c2):
end do:

quit;
