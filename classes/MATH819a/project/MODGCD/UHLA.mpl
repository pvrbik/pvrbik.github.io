interface(quiet=true):

inField:=proc(inX,p,q) local a,b,invb, x:
    
    x:=simplify(inX);
    
    a:=numer(x);
    b:=denom(x);
    
    look:=(b,p);
    look:=Gcdex(b,p,t,'invb') mod q;
    
    return simplify(x*b*invb):
    
end proc:

UHLA:=proc(inA,p,q,inU0,inW0,B,inGam) 
local a,u0,w0,phi,alpha,u,w, gamma, ss, tt, look, e, M, c, sigmabar, taubar, qq, sigma, tau;
    
    a:=inA: u0:=inU0: w0:=inW0:
    
    phi:=x-> Rem(x,p,t) mod q:
    
    alpha:=lcoeff(a,x):
    
    if nargs<7 then
        gamma:=alpha:
    else
        gamma:=inGam:
    end if:
    
    a:=gamma*a:
    u0:=phi(gamma*u0/lcoeff(u0,x)):
    w0:=phi(alpha*w0/lcoeff(w0,x)):
    
    cc:=RootOf(p) mod q:
    subs(cc=t, subs(t=cc,Gcdex(u0,w0,x,'ss','tt') mod q)):
    
	simplify(Expand(u0*ss+w0*tt) mod q);

    ss:=inField(ss,p,q);
    tt:=inField(tt,p,q);
    
    look:=(ss,tt);
        
    look:=phi(u0*ss+w0*tt);
    
    u:=u0:
    w:=w0:
    
    e:=Expand(a-u*w) mod q;
    M:=p:
    
    while (e<>0 and degree(M,t)<2*B*degree(gamma,t)) do
        
        c:=Quo(e,M,t,'r1') mod 3:
        
        if (r1<>0) then 
            return "something wrong";
        end if:
        
        sigmabar:=phi(ss*c):
        taubar:=phi(tt*x):
        
        qq:=Quo(sigmabar,w0,x,'r') mod q:
        qq:=inField(qq,p,q);
        sigma:=r:
        sigma:=inField(sigma,p,q);
        tau:=phi(taubar+qq*u0):
        
        u:=u+tau*M:
        w:=w+sigma*M:
        e:=Expand(a-u*w) mod q:
        M:=M*p:
        
    end do:
    
    if e=0 then
        sigma:=content(u,x):
        u:=u/sigma:
        w:=w/(gamma/sigma):
        return (u,w);
    else
        return "FAIL":
    end if:
    
    return 1;
    
end proc:

q:=3:

#abar:=t*x^5-t^6*x^2+1:
#g:=x^5*(t^3-t):

abar:=(t^2+t)*x^2;
g:=(x+t+1);

a:=g*abar:

p:=t^3+2*t+1:

u0:=Rem(abar,p,t) mod q;
w0:=Rem(g,p,t) mod q;

Rem(Expand(Rem(a,p,t) mod q - u0*w0) mod q, p, t) mod q;

trace(UHLA);
#trace(inField);
UHLA(a,p,q,u0,w0,20);

quit();
