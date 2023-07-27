myGcd:=proc(a,b,p) local ca,cb,cg:
    ca:=Content(a,t,'ppa') mod p:
    cb:=Content(b,t,'ppb') mod p:
    cg:=Gcd(ca,cb) mod p:
    return Expand(cg*(Gcd(ppa,ppb) mod p)) mod p:
end proc:

fgcd:=proc(inF1,inF2,p,q) local g, f1, f2,r:
    f1:=inF1 mod q:
    f2:=inF2 mod q:
    r:=RootOf(p):
    g:=subs(r=t, (myGcd(subs(t=r,f1),subs(t=r,f2),q))):
    return Expand(g) mod q:
end proc:

NextMonicPrime:=proc(p,t,q) local np:
    np:=Nextprime(p,t) mod q:
    if lcoeff(np,t)=1 then 
        return np:
    else
        return Nextprime(t^(degree(np,t)+1),t) mod q:
    end if
end proc:
