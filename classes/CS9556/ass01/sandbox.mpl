interface(quiet=true):

GetM:=(n,w)->Matrix(n,shape=Vandermonde[<seq(w^i,i=0..n-1)>]);

A:=GetM(2^2,w);
B:=GetM(2^2,1/w);


C:=(A.B);

eval( C, w=exp(2*I*Pi/4) );

s:=C[4,2];

eval(s,[w^2=-1,w^4=1]);

w:=exp(2*I*Pi/8);

evalc(w^8);


t:=evalc(w^3);

seq(evalc( t^i ), i=1..8);

quit;