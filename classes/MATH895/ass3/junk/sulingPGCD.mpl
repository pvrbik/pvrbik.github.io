# PGCD:

PGCD := proc(AA::polynom,BB::polynom,p::posint,var::list)
local k,A,B,C,a,b,c,alpha,evalpts,Gs,g,n,Aa,Ba,Ca,m,ga,H;
    
    k := nops(var);
    A,B := AA,BB;
    if k=1 then
        C := Gcd(A,B) mod p;
        if degree(C)=0 then C := 1; fi;
        return C;
    fi;
    
    a := Content(A,var[1..-2],'A') mod p; A;
    b := Content(B,var[1..-2],'B') mod p; B;
    c := Gcd(a,b) mod p;
    g := Gcd(lcoeff(A,var[1..-2]), lcoeff(B,var[1..-2])) mod p;
    
    alpha,evalpts,Gs := 0,[],[];
    n := min(degree(A),degree(B));
    
    while true do
        
        while subs(var[k]=alpha,g)=0 do
            alpha := alpha+1;
        od;
        
        Aa := subs(var[k]=alpha,A) mod p;
        Ba := subs(var[k]=alpha,B) mod p;
        Ca := PGCD(Aa,Ba,p,var[1..-2]);
        m  := degree(Ca);
        ga := subs(var[k]=alpha,g);
        Ca := ga*Ca/lcoeff(Ca) mod p;
        
        if m<n then #previous evaluation points are unlucky
            n := m;
            evalpts := [alpha];
            Gs := [Ca];
        elif m=n then
            evalpts := [op(evalpts),alpha];
            Gs := [op(Gs), Ca];
        fi;
        
        if nops(evalpts)>n then # if enough points
            
            H := Interp(evalpts,Gs,var[k]) mod p;
            
            C:=Primpart(H,var[1..-2]) mod p:
            
            if lcoeff(C,var[1..-2])=g then
            if Divide(A,C) mod p and Divide(B,C) mod p then
                return Primpart(c*C) mod p;
            elif m=0 then return c; fi;
            fi;
        fi;
        
        alpha := alpha + 1;
    od;
    
end:


