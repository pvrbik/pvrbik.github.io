locPhi := proc(a, p, q)
    Rem(a, p, t) mod q;
end:

Monic := proc(a, p, q)
local lcA, lcAinv, rof, g;
    lcA := lcoeff(a, x);
    g:=Gcdex(lcA, p, t, 'lcAinv') mod q;
    lcAinv := subs(rof=t, lcAinv);
    return collect(locPhi(a*lcAinv,p,q),x);
end:

replace_lc := proc(f,a) local n,lc:
    
    n:=degree(f,x):
    lc:=lcoeff(f,x):
    return (f-lc*x^n+a*x^n):
    
end proc:

fgcd:=proc(inF1,inF2,p,q) local g, f1, f2,r:
    f1:=inF1 mod q:
    f2:=inF2 mod q:
    r:=RootOf(p):
    g:=subs(r=t, (myGcd(subs(t=r,f1),subs(t=r,f2),q))):
    return Expand(g) mod q:
end proc:

myGcd:=proc(a,b,p) local ca,cb,cg:
    ca:=Content(a,t,'ppa') mod p:
    cb:=Content(b,t,'ppb') mod p:
    cg:=Gcd(ca,cb) mod p:
    return Expand(cg*(Gcd(ppa,ppb) mod p)) mod p:
end proc: