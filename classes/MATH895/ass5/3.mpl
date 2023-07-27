interface(quiet=true):
# Part a)

# Ordinary Gaussian elimination with back substitution.
# Warning,  computation interrupted
# Part b)

# Finds a prime p s.t. M(e) mod p splits into distinct linear factos.
NextGoodPrime := proc(pp, k)
	local p;
	p := nextprime(pp);
	while(p mod k <> 1) do p := nextprime(p); end do;
	p;
end proc:

# Finding the roots of M(e) mod p.
RootsModP := proc(M, p)
	map( r -> r[1], Roots(M) mod p );
end proc:

# The following function checks if a Vector (After reducing modulo M) is zero or not.
# It is quite efficient in the sense that as soon as a non-zero
# element is found, it returnes false.
IsVectorZero := proc(V, d, M, e)
	rtable_scanblock(V, [1..d], 'noindex', x->evalb(x = 0), 'stopresult' = false);
end:

# This function checks if there is a FAIL value in a Vector.
# Like previous function, it is efficient because it stops as
# soon as it finds a FAIL value or scans the whole rtable
NotFailed := proc(V, d)
	rtable_scanblock(V, [1..d], 'noindex', x->evalb(x <> FAIL), 'stopresult' = false); 
end:

# The modular algorithm.
ModSolve := proc(A1, b1, n, M, k, e)
	local p, r, X, R, t, i, x_p, m, x,j,s, L, A, b;
	p := modp1(Prime(1)); m := 1;

	L := ilcm( seq(seq(denom(A1[i,j]),i=1..n),j=1..n),
        	   seq(denom(b1[i]),i=1..n) );

	A := L*A1; b := L*b1;	

	while true do
		p := NextGoodPrime(p, k);
		R := RootsModP(M, p);
		i := 0;
		for r in R do
			i := i + 1;
			t[i] := Linsolve(eval(A, e=r), eval(b, e=r)) mod p;
		end do;

		x_p := Vector([seq( Interp(R,[seq( t[s][j] ,s=1..i)], e) mod p, j = 1..n )]);

		if m = 1 then 
			X := x_p;
			m := p;
		else 
			X := Vector([ seq( chrem([X[i],x_p[i]],[m,p])  , i =1..n ) ]);
			m := m * p;
		end if;

		x := Vector([ seq( iratrecon(X[i], m) , i=1..n) ]);
			
		if NotFailed(x, n) then 
			#A.x - b = 0?	
			if IsVectorZero(map(rem, A.x-b, M, e) ,n) then
				return x;
			end if;
		end if;	
	od;

end proc:

read "systems/sys49.txt":
A := map(rem, A, M, e): b := map(rem, b, M, e):

tt := time():
xx := ModSolve(A, b, 49, M,5, e);
time() - tt;


convert(map(rem, A.xx - b, M, e), set);
convert(map(rem, A.xx - b, M, e), list);

read "systems/sys100.txt":
A := map(rem, A, M, e): b := map(rem, b, M, e):

tt := time():
xx := ModSolve(A, b, 100, M,24, e);
time() - tt;


convert(map(rem, A.xx - b, M, e), set);
convert(map(rem, A.xx - b, M, e), list);




	read "systems/sys196.txt":
A := map(rem, A, M, e): b := map(rem, b, M, e):

tt := time():
xx := ModSolve(A, b, 196, M,3, e);
time() - tt;


convert(map(rem, A.xx - b, M, e), set);
convert(map(rem, A.xx - b, M, e), list);






