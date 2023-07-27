interface(quiet=true):

ModGcd:=proc(inA,inB,q) 
local a, b, Phi, contA, contB, contG, gam, G, M, u, p, lcA, Ap, Bp, gp, adj, g;
    
    a:=inA:
    b:=inB:
    
    read "CRT.mpl":
    
    Phi:=(p,f)-> Rem(f,p,t) mod q:
    
    contA:=content(a,x);
    contB:=content(b,x);
    contG:=Gcd(contA,contB)  mod q;
    
    a:=simplify(a/contA);
    b:=simplify(b/contB);
    
    gam:=Gcd(lcoeff(a,x), lcoeff(b,x) ) mod q:
    G:=0:
    M:=1:
    u:=0:
    p:=t^2:
    lcA:=lcoeff(a,x):
    
    while (true) do
        p:=Nextprime(p,t) mod q;
        
        if (lcoeff(p,t)<>1) then
            p:=Nextprime(p,t) mod q;
        end if:
        
        while ( Rem(lcA,p,t) mod q = 0) do
            p:=Nextprime(p,t) mod q:
        end do:
        
        print("p", p, q);
        
#        Ap:=Phi(p,a);
#        Bp:=Phi(p,b);
        print("A",a);
        Ap:=Factor(Rem(a,p,t) mod q) mod q;
        print("Ap", Factor(Ap) mod q):
        Bp:=Factor(Rem(b,p,t) mod q) mod q;
        print("Bp", Factor(Bp) mod q):
        
        alias(c=RootOf(p) mod q);
        gp:=subs(c=t, subs(t=c,Gcd(Ap,Bp) mod q));
        Factor(gp) mod q;
        
        adj:=Phi(p,gam);
        gp:=Rem(adj*gp,p,t) mod q;
        print("gp",gp);
        
        if (G=0) then 
            G:=gp:
            M:=p:
        elif degree(gp,x) = 0 then
#           do nothing. . . but why?
        elif degree(gp,x) > degree(G,x) then
#           do nothing
#           here for debugging purposees
        elif degree(gp,t) < degree(G,t) then
            G:=Factor(gp) mod q:
            M:=Factor(p) mod q:
        else
            u:=Factor(CRT([G,gp],[M,p],t,q)) mod q:
            u:=Phi(p*M,u);
            Factor(u) mod q;
            
            if u=Rem(G,M*p,t) mod q then
                g:=primpart(u,x):
                
                if ( Rem(a,g,t) mod q =0) and ( Rem(b,g,t) mod q =0) then
                    return contG*g;
                end if:
            end if:
            G:=Factor(u) mod q:
            M:=Factor(M*p) mod q:
        end if:
        
    end do:
    
end proc:


#trace(ModGcd);
#a:=t^2*(t+1)*x:
#b:=t*(t+1)*x:

#a:=t^2*(t+1)*(x+1)*(x+3)*(x+5)*(x^3+x+1)*(t^2+1)*t:
#b:=t^2*(t+1)*(x+1)*(x+5)*(x^3+x+1)*(t^2+1):

#a:=(t+3)*t^2*(t+1)*(x+1)*(x+3);
#b:=t^2*(t+1)*(x+1)*(x+5);

abar:=t*x^5-t^6*x^2+1;
bbar:=t*x^4+x^2+t^7;
g:=x*(t^3+2*t);

#g:=(t^3-t)*x^5-t^11*x^3+t^7*x^3+t^9+1;
#g:=(t^3-t)-t;

a:=g*abar;
b:=g*bbar;

#a:=(t^3*x+1)*(x+2) ;
#b:=(t^3*x+1);


print("hi");
Factor(a) mod 3;
Factor(b) mod 3;

p:=3:
Factor(ModGcd(a,b,p)) mod p;
Factor(Gcd(a,b) mod p) mod p;

quit;