interface(quiet=true):

myGcd:=proc(a,b,p)
    
    ca:=content(a,t,'ppa'):
    cb:=content(b,t,'ppb'):
    cg:=Gcd(ca,cb) mod p:
    
    return cg*(Gcd(ppa,ppb) mod p):
    
end proc:

fgcd:=proc(f1,f2,m)
    
    alias(c=RootOf(m) mod q);
    return subs(c=t, subs(t=c,
    
    (Gcdex(f1,f2,x) mod q)*(Gcdex(f1,f2,t) mod q)
    
    )):
    
end proc:

#sfgcd:=(a,b,p)->Factor(fgcd(a,b,p)) mod q:
sfgcd:=(a,b,p)->Expand(fgcd(a,b,p)) mod q:

q:=3:

abar:=t*x^5-t^6*x^2+1:
bbar:=t*x^4+x^2+t^7:
g:=x^5*(t^3-t)+x:

a:=g*abar:
b:=g*bbar:

contA:=content(a,x);
contB:=content(b,x);
contG:=Gcd(contA,contB) mod q;

a:=primpart(a):
b:=primpart(b):

h:=myGcd(a,b,q);

p:=Nextprime(t^2,t) mod q:

gam:=Gcd(lcoeff(a,x), lcoeff(b,x) ) mod q:

us:=[]:
fs:=[]:
hs:=[]:
n:=5:
for i from 1 to n do
    ap:=(Rem(a,p,t) mod q);
    bp:=(Rem(b,p,t) mod q);
    gp:=sfgcd(ap,bp,p);
    cor:=Rem(gam,p,t) mod q;
    gp:=Rem(cor*gp,p,t) mod q;
    
    hp:=Rem(h,p,t) mod q:
    if (degree(gp,x)>0) then
        hs:=[op(hs),hp]:
        us:=[op(us),gp]:
        fs:=[op(fs),p]:
    end if;
    p:=Nextprime(p,t) mod q;
    while (lcoeff(p,t)<>1) do
        p:=Nextprime(p,t) mod q;
    end do:
end do:

print("hs",hs);
print("us",us);
print("fs",fs);

read "CRT.mpl";

n:=nops(us):

g:=CRT(us,fs,t,q);
H:=CRT(hs,fs,t,q);

seq( Rem(h,fs[i],t) mod q, i=1..n);

g:=contG*primpart(g,x):

print(h,H,g);

quit();
