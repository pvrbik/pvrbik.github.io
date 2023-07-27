interface(quiet=true):

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
    g:=subs(r=t, simplify(myGcd(subs(t=r,f1),subs(t=r,f2),q))):
    return Expand(g) mod q:
end proc:

fcontent:=proc(f,v,p,q)
    return h_fcontent([coeffs(f,v)],p,q):
end proc:

h_fcontent:=proc(A,p,q):
    if type(A[1],integer) then
        return h_fcontent( [A[1]+p mod q,op(A[2..-1])],p,q)
    elif nops(A)=1 then
        return A[1]:
    else
        return Gcd(A[1], h_fcontent(A[2..-1],p,q) ) mod q:
    end if:
end proc:

monic:=proc(f,p,q) local lc:
    
    lc:=lcoeff(f,x):
    Gcdex(lc,p,t,'invLc') mod q:
    return Expand (f*invLc) mod q:
#    return f;
    
end proc:

q:=3:
p:=Nextprime(t^2,t) mod q: 

for i from 1 to 1 do
    p:=Nextprime(p,t) mod q:
end do;

p:=p;

Phi:=x->Rem(x,p,t) mod q:

Phi(p);

#bad case
abar:=t^3*x^5-t^6*x^2+1:
bbar:=t^2*x^4+x^2+t^7:

fgcd(Phi(abar), Phi(bbar), p,q);

g:=x^5*(t^3-t)+x:

#abar:=t*x^3-t^6*x^2+1;
#bbar:=t*x^2+x^2+t^7;
#g:=(t^3-t)*x^5-t^11*x^3+t^7*x^3+t^9+1;

abar:=t*x^5-t^6*x^2+1;
bbar:=t*x^4+x^2+t^7;
g:=(t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1:

a:=g*abar:
b:=g*bbar:

h:=myGcd(a,b,q):
print("goal",Phi(h));

ap:=Phi(a): bp:=Phi(b):
a:=collect(a,x); b:=collect(b,x);
ap:=collect(ap,x); bp:=collect(bp,x);

g:=fgcd(ap,bp,p,q):
g:=Phi(g):
g:=collect(g,x);


lcoeff(a,x): lcoeff(b,x):
gam:=Gcd(lcoeff(a,x), lcoeff(b,x)) mod q;
gam:=Phi(gam);


gpc:=Phi(gam*g):
gpc:=collect(gpc,x);

#these should be equal
collect(Phi(monic(gpc,p,q)),x);
collect(Phi(monic(h,p,q)),x);
