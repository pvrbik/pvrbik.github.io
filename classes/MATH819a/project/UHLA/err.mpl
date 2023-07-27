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


q:=3;

#(this is the abar and g from question 2)
u:=(t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1;
w:=t*x^5-t^6*x^2+1;

#this is the prime you chose
p:=t^3+2*t+1;

#but
g:=fgcd(u,w,p,q);

#so u0 and w0 will not be coprime in the field. This is not a good prime.

R1:=Rem(u,g,x) mod q;
R2:=Rem(w,g,x) mod q;

Rem(R1,t,x) mod q;
Rem(R2,t,x) mod q;

quit;
