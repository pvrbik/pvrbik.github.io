p:=17:
a:=x->mods(-x^3+3*x+1,p):
b:=x-> mods( 2*x^4-3*x^3-2*x^2+x+1,p):
pru:=[seq(mods(2^i,p),i=0..7)]:
pru;
A:=pru: B:=pru:
A:=map(a,A);
B:=map(b,B);

C:=[seq(mods(A[i]*B[i],p),i=1..nops(A))];

f:=mods(Interp(pru,C,x) mod 17,p);
expand(a(x)*b(x));
quit: