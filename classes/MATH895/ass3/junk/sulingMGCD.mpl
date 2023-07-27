read "PGCD.mpl":

MGCD := proc(AA::polynom, BB::polynom, var::list)
local p,A,B,C,a,b,c,g,q,H,n,m,Ap,Bp,gp,Cp,h;
    p := nextprime(10^3); 
    a,b := icontent(AA),icontent(BB);
    A,B := AA/a,BB/b;
    c := igcd(a,b);
    g := igcd(lcoeff(A),lcoeff(B));
    q,H := 1,0;
    n := min(degree(A),degree(B));
    
    while true do
        while irem(g,p)=0 do 
            p := nextprime(p);
        od;
        
        Ap,Bp := A mod p, B mod p;
        gp := g mod p; 
        
#       CHEATING
#        Cp := Gcd(Ap,Bp) mod p:
        Cp:=PGCD(Ap,Bp,p,var);
#       CHEATING
        
        m := degree(Cp);
        Cp := Expand(gp*Cp/lcoeff(Cp)) mod p;
        
        if m<n then # previous primes are unlucky
            n := m;
            q := p;
            H := Cp;
        elif m=n then
            h := mods(chrem([H,Cp],[q,p]), q*p);
            q := q*p;
            if expand(H-h)=0 then
                C := Primpart(H,var) mod q;
                if divide(A,C) and divide(B,C) then
                    return c*C:
                elif m=0 then return c; fi;
            fi;
            H := h;
        fi;
        p := nextprime(p);
    od;
end:
