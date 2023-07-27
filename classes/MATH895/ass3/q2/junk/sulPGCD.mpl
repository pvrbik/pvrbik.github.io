# PGCD:

PGCD := proc(AA::polynom,BB::polynom,p::posint,var::list)
local k,A,B,C,a,b,c,alpha,as,g,n,Aa,Ba,Ca,m,ga,H,M,Ma,vi,h;
    
    k := nops(var);
    A,B := AA,BB;
    
    if k=1 then
        C := Gcd(A,B) mod p;
        if degree(C)=0 then 
            C := 1; 
        fi;
        return C;
    fi;
    
    a := Content(A,var[1..-2],'A') mod p;
    b := Content(B,var[1..-2],'B') mod p;
    c := Gcd(a,b) mod p;
    g := Gcd(lcoeff(A,var[1..-2]), lcoeff(B,var[1..-2])) mod p;
    
    alpha,as,H,M := 1,[],0,0;
    n := min(degree(A),degree(B));
    
    while true do
        while (alpha in as) or (subs(var[k]=alpha,g)=0) do
            as := [op(as),alpha];
            alpha := alpha+1 mod p;
        od;
        
        as := [op(as),alpha];
        Aa := subs(var[k]=alpha,A) mod p;
        Ba := subs(var[k]=alpha,B) mod p;
        Ca:=Gcd(Aa,Ba) mod p;
        
        m  := degree(Ca);
        ga := subs(var[k]=alpha,g);
        lcoeff(Ca,var[1..-2]); ga;
        Ca := Expand(ga*Ca/lcoeff(Ca,var[1..-2])) mod p;
        
        if H=0 or m<n then #previous evaluation points are unlucky
            n := m;
            h := H;
            H := Ca;
            M := var[k]-alpha;
        elif m=n then
            h := H;
            Ma := eval(M,var[k]=alpha) mod p;
            vi := (Ca-eval(H,var[k]=alpha))/Ma mod p;
            H := Expand(H+vi*M) mod p;
            M := Expand(M*(var[k]-alpha)) mod p;
        fi;
        
        if Expand(H-h) mod p = 0 then
            C := Primpart(H,var[1..-2]) mod p;
            if Divide(A,C) mod p and Divide(B,C) mod p then
                return Primpart(c*C) mod p;
            elif m=0 then 
                return c; 
            fi;
        fi;
        
        alpha := alpha + 1 mod p;
    od;
    
end:

