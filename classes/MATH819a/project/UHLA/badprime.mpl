interface(quiet=true);
NextMonicPrime:=proc(p,t,q) local np:
    np:=Nextprime(p,t) mod q:
    if lcoeff(np,t)=1 then 
        return np:
    else
        return Nextprime(t^(degree(np,t)+1),t) mod q:
    end if
end proc:


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

q:=3;

p:=Nextprime(1,t) mod q;

u:=(t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1;
w:=t*x^4+x^2+t^7;

R:=Resultant(u,w,x) mod q;
Factor(R) mod q;

for i from 1 to 100000 do
    p:=NextMonicPrime(p,t,q);
    g:=fgcd(u,w,p,q);
    
    if g<>1 then
        print ("unusable prime", p, g);
    end if:
end do:

print(p);

quit;