MGE:=proc(inA,inb,m,k)
local ps,ys,xps,n,P,p,badprime,betas,xpbs,beta,Apb,bpb,xpb,xp,i,x,L,A,b:
	ps:=NULL:
	ys:=NULL:
	xps:=NULL:
	n:=LinearAlgebra[Dimension](inb):
	
#	cleaning up
	A:=map(rem,inA,m,e):
	L:=ilcm(seq(seq(denom(A[i,j]),i=1..n),j=1..n)):
	A:=A*L:
	b:=inb*L:

#	p:=0:
	p:=10^16:
	P:=1:	
	x:=Vector(1..n,0):

	while true do

		p:=nextprime(p):

		while not(1 = p mod k) do
			p:=nextprime(p):
		end do:			
printf("%d \n", p);
		
		badprime:=false:

		betas:=map(x->x[1],Roots(m) mod p):
	
		xpbs:=NULL:	

		for beta in betas do
			Apb:=eval(A,e=beta) mod p:
			bpb:=eval(b,e=beta) mod p:
			xpb:=Linsolve(Apb,bpb) mod p:

#			a bad prime is one that makes A go singluar.
			if type(xpb,function) then
				badprime:=true:
				break:
			end if:

			xpbs:=xpbs,xpb:
		end do:

		if not(badprime) then
#			P:=P*p:
#			ps:=ps,p:

			xp:=Vector(1..n,0):

			for i from 1 to n do
				xp[i]:=Interp(betas,[seq(v[i],v in xpbs)],e) mod p: 
			end do:			
			
#			xps:=xps,xp:
#			x:=chrem([xps],[ps]):

			x:=chrem([x,xp],[P,p]):
			P:=P*p:		
	
			xx:=map(`iratrecon`,x,P):

printf("%A \n", evalb(FAIL in convert(x,set))):
printf("%A \n", convert(map(rem,A.xx-b,m,e),set)):
			
			if not(FAIL in convert(xx,set)) and convert(map(rem,A.xx-b,m,e),set)={0} then
				return xx:
			end if:
		end if:
	end do:

end proc:
