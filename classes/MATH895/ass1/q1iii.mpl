#interface(quiet=true):

r:=6;
k:=4;
n:=2^k;
p:=2^(2^r)+1;
w:=2^(2^(1+r)/n);

numtheory[order](w,p);
#so w is indeed a primitive 16th root of unity.

seq(w^j mod p, j=1..n);
seq(-w^(j+n/2) mod p,j=1..n);
#We see that this relation is true for j=1..n, since w has order n we can conclude that it is true for any j.

