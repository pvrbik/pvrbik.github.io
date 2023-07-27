interface(quiet=true):

### Project ###
# Part (1): Chinese Remainder Theorem:
`mod` := mods:
CRT := proc(u::list, m::list, q::posint)
	local w, n, mm, i, s, mmInv;
	if nops(u)=1 then u[1]
	else
	  n  := nops(u)-1;
	  mm := mul(m[i], i=1..n);
	  w  := CRT(u[1..n], m[1..n]);
#print(u_bar = w); 
	  Gcdex(m[n+1], mm, t, 's', 'mmInv') mod q;
	  Expand(w  + rem((u[n+1]- w)*mmInv, m[n+1], t) * mm) mod q;
	fi;
end:

# Part (2): Modulo GCD:
ZPTGCD := proc(f1::polynom, f2::polynom, m::polynom, q::posint)
	subs(RootOf(m)=t, Gcd(subs(t=RootOf(m),f1),subs(t=RootOf(m),f2)) mod q);
end:
Phi := proc(a::polynom, p::polynom, q::posint)
    Rem(a, p, t) mod q;
end:
Monic := proc(a::polynom, p::polynom, q::posint)
	local lcA, lcAinv;
	lcA := lcoeff(a, x);
	Gcdex(lcA, p, x, 'lcAinv') mod q;
print(lcA, lcAinv);
	return collect(Phi(a*lcAinv,p,q),x);
end:

ModGCD := proc(a::polynom, b::polynom, q::posint)
local a_p, b_p, g_p, p, G, u, r, M;
    
    p := Nextprime(t^2,t) mod q;  
    G := 0;  
    M := 1;
    r := gcd(lcoeff(a,x), lcoeff(b,x));
    
    while true do
        
        while Phi(lcoeff(a,x),p,q) = 0 do 
            p := Nextprime(p,t) mod q;
        od;
        
        while lcoeff(p,t) <> 1 do 
            p := Nextprime(t^(degree(p,x)+1),t) mod q;
        od;
        
        a_p := Phi(a,p,q);
        b_p:= Phi(b,p,q);
        
        g_p := ZPTGCD(a_p, b_p, p, q);
        
        if degree(g_p,x)=0 then return 1; fi;
            g_p := Phi(Phi(r,p,q)*g_p,p,q);
            
            if G=0 then 
                G:=g_p; 
                M:=p;
            elif degree(g_p,x)>degree(G,x) then 
                print('unlucky_prime'=p);
            elif degree(g_p,x)<degree(G,x) then 
                G:=g_p; 
                M:=p;
            else
                u := CRT([G, g_p], [M, p], q);
                if Expand(u-G) mod q = 0 then
                    g_p := collect(primpart(u,x),x);
                    if Phi(a,g_p,q)=0 and Phi(b,g_p,q) =0 then 
                        return g_p; 
                    fi;
                fi;
                G := u;  
                M := M*p;
            fi;
            
            p := Nextprime(p,t) mod q;
        od;
end:

q:=3:
g := (t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1;
a_bar := t*x^5-t^6*x^2+1;
b_bar := t*x^4+x^2+t^7;

a := collect(expand(g*a_bar),x); b := collect(expand(g*b_bar), x);
a := expand(g*a_bar); b := expand(g*b_bar);

trace(ModGCD);
ModGCD(a,b,q);

quit();
