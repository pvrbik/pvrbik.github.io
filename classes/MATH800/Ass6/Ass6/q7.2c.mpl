gam:=20679;
delta:=11082;
p:=31847;
alpha:=5;
beta:=26379;
x:=20543;
a:=7973;

Roots(delta*k - (x-a*gam)) mod (p-1);

delta*19387 mod (p-1)= ((x-a*gam)) mod (p-1);

gam = (5 &^ 19387) mod p;

quit;
