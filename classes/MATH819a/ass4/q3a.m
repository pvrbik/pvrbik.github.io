#interface(quiet=true):
UHLA:=proc(inA,p,inU0,inW0,B,inGam) 
local a,u0,w0,phi,alpha,gamma,u,w,e,modulus,c,sigmabar,taubar,sigma,tau,q,r:
    
    a:=inA: u0:=inU0: w0:=inW0: 
    `mod`:=mods:
    phi:=x->expand(x) mod p:
    alpha:=lcoeff(a,x):
    if nargs<6 then 
        gamma:=alpha:
    else
        gamma:=inGam:
    end if:
    
    a:=gamma*a:
    u0:=phi(gamma*u0/lcoeff(u0,x)):
    w0:=phi(alpha*w0/lcoeff(w0,x)):
    
    Gcdex(u0,w0,x,'s','t') mod p:
    
    #u:=u0:
    #w:=w0:
    u:=replace_lc(u0,gamma):
    w:=replace_lc(w0,alpha):
    
    e:=expand(a-u*w):
    modulus:=p:
    
    while (e<>0 and modulus<2*B*gamma) do
        c:=e/modulus;
        c:=phi(c);
        sigmabar:=phi(s*c);
        taubar:=phi(t*c):
        q:=Quo(sigmabar,w0,x,'r') mod p:
        sigma:=r:
        tau:=phi(taubar+q*u0):
        
        print("check1",phi(sigma*u0+tau*w0) = phi(c));
        
        u:=u+tau*modulus:
        w:=w+sigma*modulus:
        
        e:=expand(a-u*w):
        modulus:=modulus*p:
        
        print("check2",e mod modulus);
        
    end do:
    
    if e=0 then
        sigma:=content(u,x):
        u:=u/sigma:
        w:=w/(gamma/sigma):
        return (u,w):
    else
        return "FAIL":
    end if
    
end proc:

replace_lc := proc(f,a) local n,lc:
    
    n:=degree(f,x):
    lc:=lcoeff(f,x):
    return (f-lc*x^n+a*x^n):
    
end proc:

##Question 3a)
#a:=x^4-2*x^3-233*x^2-214*x+85:
#u0:=x^2-3*x-2:
#w0:=x^2+x+3:
#p:=7:
#(n,m):=UHLA(a,p,u0,w0,233);
#expand(n*m=a);

#Question 3b)
b:=48*x^4-22*x^3+47*x^2+144:
u0:=x^2+4*x+2:
w0:=x^2+4*x+5:
p:=7:
#(n,m):=UHLA(b,p,u0,w0,144,6);
(n,m):=UHLA(b,p,u0,w0,144);
expand(n*m=b);

quit;
