interface(quiet=true):

ModGcd:=proc(a,b,q) local gamma, G, M, Phi, symR, p, lcA, gp, u, g:
    
    read "CRT.mpl":
    
    `mod`:=mods:
    
    Phi:=(p,f)-> simplify(Rem(f,p,t) mod q):
    
    gamma:=Gcd(lcoeff(a,x), lcoeff(b,x) ) mod q:
    G:=0:
    M:=1:
    u:=0;
    p:=t:
    
    lcA:=lcoeff(a,x):
    
    while (true) do
        p:=Nextprime(p,t) mod q;
        
        while (Phi(p,lcA) = 0) do
            p:=Nextprime(p,t) mod q:
            print("bad prime",p):
        end do:
        
        look:=Phi(p,a);
        look:=Phi(p,b);
        gp:=Gcd( Phi(p,a), Phi(p,b) ) mod q:
        
        if (degree(gp,x)=0) then 
            return primpart(gamma,t):
        end if:
        
        gp:=Phi(p,gamma)*gp mod q:
        
        if (G=0) then 
            G:=gp:
            M:=p:
        elif degree(gp,x) > degree(G,x) then
#           do nothing
#           here for debugging purposees
        elif degree(gp,x) < degree(G,x) then
            print("here2");
            G:=gp:
            M:=p:
        else
            print("here3");
            print([G,gp]);
            print([M,p]);
            u:=CRT([G,gp],[M,p],t,q):
            u:=Phi(M*p,u):
            G:=G:
            if u=Phi(M*p,G) then
                g:=simplify(u/content(u,[x,t])):
                
                if ( Divide(a,g) mod q ) and ( Divide(b,g) mod q) then
                    return g;
                end if:
                print("mo");
            end if:
            G:=u:
            M:=simplify(expand(M*p)):
        end if:
        
    end do:
    
end proc:

trace(ModGcd);
a:=t^2*(t+1)*(x+1)*(x+3):
b:=t^2*(t+1)*(x+1)*(x+3):
p:=7:
Factor(ModGcd(a,b,p)) mod p;
Factor(Gcd(a,b) mod p) mod p;

quit;