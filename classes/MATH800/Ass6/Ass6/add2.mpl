with[numtheory]:

r:=47;

while (true) do	
	r:=nextprime(r);

	p:=2*r+1;
	q:=2*nextprime(r)+1;

	alpha:=1;
	while not(evalb(Order(alpha,p)=(p-1)) and evalb(Order(alpha,q)=(q-1))) do
		alpha:=alpha+1:
		if alpha>p*q then break; end if;
	end do:

	if (alpha <> p*q+1) then break; end if;
		
end do:

p; q; alpha;

quit();
