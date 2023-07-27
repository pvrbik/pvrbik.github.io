read "common.mpl":
interface(quiet=true):
`mod`:=mods;
q:=3:
p:=t^2+1:

Phi:=x-> Rem(x,p,t) mod q:

a:=collect(Expand( (t*x^2+t^2*x+1)*((t+1)*x-t^3)) mod q, x):
u0:=Phi(t*x^2+t^2*x+1):
w0:=Phi((t+1)*x-t^3):

gam:=lcoeff(a,x):

a:=gam*a:

u0 := Phi(gam*Monic(u0,p,q),p,q):
w0 := Phi(gam*Monic(w0,p,q),p,q):

rof:=RootOf(p):
Gcdex(subs(t=rof,u0), subs(t=rof,w0), x, 'ss', 'tt') mod q:
ss := subs(rof=t, ss):
tt := subs(rof=t, tt):

checka:=Phi(ss*u0+tt*w0);

collect(u0,x):
collect(w0,x):

u:=replace_lc(u0,gam):
u:=collect(u,x):

w:=replace_lc(w0,gam):
w:=collect(w,x):

e:=Expand(a-u*w) mod q:
Phi(e):
modulus:=p:
rof:=RootOf(p):

B:=10;
while (e <> 0 and degree(modulus,t)<2*B*degree(gam,t)) do
    c:=Quo(e,modulus,x,'rr') mod q;
    c:=Phi(c);
    
    sigmabar:=Phi(ss*c);
    taubar:=Phi(tt*c);
    
    rr:=subs(rof=t, Rem( subs(t=rof,sigmabar), subs(t=rof,w0), x, 'qq') mod q);
    qq:=subs(rof=t, qq);
    
    sigma:=rr;
    tau:=Phi(Expand(taubar+qq*u0) mod q);
    
    u:=Expand(u+tau*modulus) mod q;
    w:=Expand(w+sigma*modulus) mod q;
    
    e:=Expand(a-u*w) mod q;
    
    modulus:=modulus*p;
    
end do;

if e=0 then
    sigma:=content(u,x);
    u:=Quo(u,sigma,x) mod q;
    t1:=Quo(gam,sigma,x) mod q:
    w:=Quo(w,t1,x) mod q;
    print(u,w);
else
    return "FAIL";
end if:

quit;
