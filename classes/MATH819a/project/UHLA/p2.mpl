# *** Smaller example:
read "common.mpl": 
interface(quiet=true):
p := t^2+1; q := 3;

a := collect(Expand((t*x^2+t^2*x+1)*((t+1)*x-t^3)) mod q,x);
Factor(a) mod q;

u0 := Phi((t*x^2+t^2*x+1), p,q); w0 := Phi((t+1)*x-t^3,p,q);

ZPTGCD(u0, w0, p, q);

gam := lcoeff(a,x);
a := gam*a;

u0 := Phi(gam*Monic(u0,p,q),p,q);
w0 := Phi(gam*Monic(w0,p,q),p,q);

rof:=RootOf(p):
g_p := Gcdex(subs(t=rof,w0), subs(t=rof,u0), x, 'ss', 'tt') mod q;
ss := subs(rof=t, ss);
tt := subs(rof=t, tt);

U,W := u0, w0;
k := 1;
while k < 3 do
    e := Expand(a-U*W) mod q;
    if e=0 then break; fi;
    c := Phi(Quo(e,p^k, x, 'rr') mod q, p, q);
    rr;
    
    
    r:=subs(rof=t, Rem( subs(t=rof,c*ss), subs(t=rof,u0), x, 'qq') mod q);
    qq:=subs(rof=t, qq);
    
    uk:=Phi(r, p,q);
    wk:=Phi(Expand( w0*qq+c*tt ) mod q, p, q);
    
    
    U:=Expand(U + uk*p^k) mod q;
    W:=Expand(W + wk*p^k) mod q;
    
    k:=k+1;
    
#    look:=collect(U,x);
#    look:=collect(W,x);
    
#    U := Phi(gam*(Quo(U,lcoeff(U,x),x, 'q1') mod q),p^k,q);
#    W := Phi(gam*(Quo(W,lcoeff(W,x),x, 'q2') mod q),p^k,q);
#    q1; q2;
od;

