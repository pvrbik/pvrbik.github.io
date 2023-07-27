interface(quiet=true);

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

q:=3;
g := (t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1;
abar := t*x^5-t^6*x^2+1;
bbar := t*x^4+x^2+t^7;

a:=abar*g;
b:=bbar*g;

p:=1;

while Expand(abar-Rem(abar,p,t) mod q) mod q <> 0 do
    p:=NextMonicPrime(p,t,q);
    tabar:=Rem(abar,p,t) mod q;
    tbbar:=Rem(bbar,p,t) mod q;
    secT:=Resultant(abar,bbar,x) mod q;
    secT:= Rem(secT,p,t) mod q;
    if fgcd(tabar,tbbar,p,q) <> 1 or secT=0 then
        print ("bad prime", p, fgcd(tabar,tbbar,p,q), Resultant(abar,bbar,x) mod q)
    end if:
end do:

quit;