UHLA:=proc(inA,q,p,inU0,inW0,B,inGam)
local a, u0, w0, Phi, alpha, gam, rof, ss, tt, u, w, err, modulus, c, sigmabar, taubar, rr, qq, sigma, tau, t1:
    
    read "common.mpl";
    
    `mod`:=mods:
    a:=inA; u0:=inU0; w0:=inW0;
    
    Phi:=x-> Rem(x,p,t) mod q:
    
    alpha:=lcoeff(a,x):
    
    if nargs<7 then
        gam:=alpha:
    else
        gam:=inGam:
    end if:
    
    a:=gam*a:
    
    u0 := Phi(gam*Monic(u0,p,q),p,q):
    w0 := Phi(gam*Monic(w0,p,q),p,q):
    
    rof:=RootOf(p):
    Gcdex(subs(t=rof,u0), subs(t=rof,w0), x, 'ss', 'tt') mod q:
    ss := subs(rof=t, ss):
    tt := subs(rof=t, tt):
    
    u:=replace_lc(u0,gam):
    u:=collect(u,x):
    
    w:=replace_lc(w0,alpha):
    w:=collect(w,x):
    
    err:=Expand(a-u*w) mod q:
    modulus:=p:
    
    err:=Quo(err,modulus,x,'rr') mod q;
    
    while (err <> 0 and degree(modulus,t)<2*B*degree(gam,t)) do
        
        sigmabar:=Phi(ss*err);
        taubar:=Phi(tt*err);
        
        rr:=subs(rof=t, Rem( subs(t=rof,sigmabar), subs(t=rof,w0), x, 'qq') mod q);
        qq:=subs(rof=t, qq);
        
        sigma:=rr;
        tau:=Phi(Expand(taubar+qq*u0) mod q);
        
        err:=Expand(err-(u*sigma+tau*w)-sigma*tau*modulus) mod q;
#        err:=Quo(err,p,x,'rr') mod q;
        err:=Quo(err,p,t,'rr') mod q;
        
        u:=Expand(u+tau*modulus) mod q;
        w:=Expand(w+sigma*modulus) mod q;
        
        modulus:=modulus*p;
        
    end do;
    
    if err=0 then
        sigma:=content(u,x);
        u:=Quo(u,sigma,x) mod q;
        t1:=Quo(gam,sigma,x) mod q:
        w:=Quo(w,t1,x) mod q;
        return (u,w);
    else
        return "FAIL";
    end if:
    
end proc:

read "common.mpl";
q:=3;
p:=t^3+2*t+2;

Phi2:=x-> Rem(x,p,t) mod q;

u:=(t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1;
w:=t*x^5-t^6*x^2+1;

a:=u*w;

u0:=Phi2(u,p,q);
w0:=Phi2(w,p,q);

