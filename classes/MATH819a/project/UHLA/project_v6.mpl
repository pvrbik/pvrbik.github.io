# Computer Algebra Project:
# Part (1): Chinese Remainder Theorem:
restart:
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
q := 2;

u := [t^2, t^2+t+1];

m := [t^3+t+1, t^3+t^2+1];

a := CRT(u, m, q);

expand(m[1]*m[2]);

Rem(a, m[1], t) mod q;

Rem(a, m[2], t) mod q;

u := [t^2*x, t^2+t*x+1];

a := collect(CRT(u, m, q), x);

Rem(a, m[1], t) mod q; Rem(a, m[2], t) mod q;


# Part (2) : Modulo GCD:
ZPTGCD := proc(f1::polynom, f2::polynom, m::polynom, q::posint)
	local rof;
	rof:=RootOf(m);
	subs(rof=t, Gcd(subs(t=rof,f1),subs(t=rof,f2)) mod q);
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
	# for k from 1 to 10 do # for debug...
	   while Phi(lcoeff(a,x),p,q) = 0 do 
	   	p := Nextprime(p,t) mod q;
	   od;
	   while lcoeff(p,t) <> 1 do 
#print(1, M, p);
	   	p := Nextprime(t^(degree(p)+1),t) mod q;
	   od;
#print(2, 'p'=p);
	   a_p := Phi(a,p,q);
	   b_p := Phi(b,p,q);
#print(3, 'a_p'=collect(a_p,x), 'b_p'=b_p);
	   g_p := ZPTGCD(a_p, b_p, p, q);
#print(4, 'g_p'=g_p, 'G'=G);
	   if degree(g_p,x)=0 then return 1; fi;
	   g_p := Phi(Phi(r,p,q)*g_p,p,q);
#print(44, r, 'g_p'=g_p, 'G'=G);

	   if G=0 then G:=g_p; M:=p;
	   elif degree(g_p,x)>degree(G,x) then 
		print('unlucky_prime'=p);
	   elif degree(g_p,x)<degree(G,x) then 
		G:=g_p; M:=p;
	   else
#print(5, 'here',[G, g_p], [M, p]);
		u := CRT([G, g_p], [M, p], q);
#print(6, 'u'=u);
		if Expand(u-G) mod q = 0 then
		   g_p := collect(Primpart(u,x) mod q,x);
#print(7, g_p);
		   if Rem(a,g_p,x) mod q=0 and Rem(b,g_p,x) mod q=0 then 
			return g_p; 
		   fi;
		fi;
		G := u;  M := M*p;
	   fi;
	   p := Nextprime(p,t) mod q;
	od;
end:
g := (t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1;
a_bar := t*x^5-t^6*x^2+1;
b_bar := t*x^4+x^2+t^7;



a := collect(expand(g*a_bar),x); b := collect(expand(g*b_bar), x);


a := expand(g*a_bar); b := expand(g*b_bar);


p := Nextprime(t^2+t+1,t) mod 3; q := 3;
ap := collect((Phi(a, p, q)),x);  bp := collect(expand(Phi(b, p, q)),x);




ModGCD(a,b,q);

# Part (3): Linear Hensel Lifting:
p := t^3+2*t+1;

Factor(a) mod q;

g; a_bar;
u0 := Phi(a_bar,p,q);  w0 := Phi(g,p,q);




g_p := ZPTGCD(u0, w0, p, q);

Phi(u0, p, q);

rof:=RootOf(p):
g_p := Gcdex(subs(t=rof,w0), subs(t=rof,u0), x, 'ss', 'tt') mod q;
ss := subs(rof=t, ss);
tt := subs(rof=t, tt);



#check:
Phi(u0*ss+tt*w0, p, q);

# *** Smaller example: 
p := t^2+1; q := 3;


a := collect(Expand((x^2+t^2*x+t)*(x-t^3)) mod q,x);
Factor(a) mod q;


u0 := x^2-x+t; w0 := x+t;


# check:
ZPTGCD(u0, w0, p, q);

rof:=RootOf(p):
g_p := Gcdex(subs(t=rof,w0), subs(t=rof,u0), x, 'ss', 'tt') mod q;
ss := subs(rof=t, ss);
tt := subs(rof=t, tt);



U,W := u0, w0;
for k from 1 to 3 do
   e := Expand(a-U*W) mod q;
   if e=0 then break; fi;
   c := Phi(Quo(e,p^k, x, 'rr') mod q, p, q);
   uk := Phi(Rem( c*ss, u0, x, 'qq') mod q, p,q);
   wk := Phi(Expand( w0*qq+c*tt ) mod q, p, q);
   U := Expand(U + uk*p^k) mod q;
   W := Expand(W + wk*p^k) mod q;
od;













