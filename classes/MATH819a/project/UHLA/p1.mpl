interface(quiet=true):
read "common.mpl":

# *** Smaller example: 
p := t^2+1; q := 3;

a := collect(Expand((x^2+t^2*x+t)*(x-t^3)) mod q,x);
Factor(a) mod q;

u0 := x^2-x+t; w0 := x+t;

# check:
ZPTGCD(u0, w0, p, q);

rof:=RootOf(p):
g_p := Gcdex(subs(t=rof,w0), subs(t=rof,u0), x, 'ss', 'tt') mod q;

ss := subs(rof=t, ss);
tt := subs(rof=t, tt);

U,W := u0, w0;
for k from 1 to 3 do
   e := Expand(a-U*W) mod q;
   if e=0 then break; fi;
   c := Phi(Quo(e,p^k, x, 'rr') mod q, p, q);
   rr;
   uk := Phi(Rem( c*ss, u0, x, 'qq') mod q, p,q);
   wk := Phi(Expand( w0*qq+c*tt ) mod q, p, q);
   U := Expand(U + uk*p^k) mod q;
   W := Expand(W + wk*p^k) mod q;
od;

quit();
