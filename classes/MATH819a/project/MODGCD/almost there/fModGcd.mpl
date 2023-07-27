#interface(quiet=true):

fModGcd:=proc(inA,inB,q)
local Phi,a, b, contA, contB, contG, gam, G, M, p, lcA, ap, bp, gp, u, g:
    
    read "procs.mpl":
    read "CRT.mpl":
    
    `mod`:=mods;
    
    a:=inA:
    b:=inB:
    
    contA:=Content(a,x,'ppa') mod q;
    contB:=Content(b,x,'ppb') mod q;
    contG:=myGcd(contA,contB,q);
    
#   Inexplicably ppa and ppb are assigned 1.
#   I was unable to resolve this bug.
    
    a:=Primpart(a,x) mod q;
    b:=Primpart(b,x) mod q;
    
    gam:=myGcd(lcoeff(a,x), lcoeff(b,x),q);
    G:=0:
    M:=1:
    
    p:=Nextprime(t^2,t) mod q;
    
    lcA:=lcoeff(a,x):
    
    while (true) do
        
        while (Rem(lcA,p,t) mod q = 0) do 
            print("BAD PRIME",p):
            p:=NextMonicPrime(p,t,q):
        end do:
        
        Phi:=x->Rem(x,p,t) mod q:
        
        ap:=Phi(a):
        bp:=Phi(b):
        gp:=fgcd(ap,bp,p,q):
        
        if degree(gp,x)=0 then 
            return contG:
        end if:
        
#       correct gp
        gp:=Phi(gam*gp):
        gp:=Phi(gp,p,q):
        
        if G=0 then
            G:=gp:
            M:=p:
        elif degree(gp,x) > degree(G,x) then
            print("UNLUCKY PRIME",p):
#           do nothing
        elif degree(gp,x) < degree(G,x) then
            G:=gp:
            M:=p:
        else
            u:=CRT([G,gp],[M,p],t,q):
            
            if Expand(u-G) mod q=0 then
                g:=Primpart(contG*u,x) mod q:
                
                if Rem(a,g,t) mod q=0 and Rem(b,g,t) mod q =0 then
                    return g;
                end if:
            end if:
            G:=u:
            M:=M*p:
        end if:
        
        p:=NextMonicPrime(p,t,q):
        
    end do:
    
end proc:

`mod`:=mods:

q:=3;
g := (t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1;
abar := t*x^5-t^6*x^2+1;
bbar := t*x^4+x^2+t^7;

a:=abar*g;
b:=bbar*g;


