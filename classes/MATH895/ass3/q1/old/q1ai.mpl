#interface(quiet=true):

#QUESTION 1 (A)
#PART i

var:=[x,y,z];
a:=(y*x+y*z-1)*(x+7*y*(z^2-1)+1);
b:=(y*x+y*z-1)*(x+7*y*(z^3-1)+1);
g:=gcd(a,b);
abar:=a/g;
bbar:=b/g;

#BAD PRIMES
lcoeff(a,var);
lcoeff(b,var);
#So there are no bad primes.
#bad primes are avoided by doing
#       g:=igcd(lcA,lcB):
#
#        p:=nextprime(p):
#        
#        while g mod p=0 do
#            p:=nextprime(p):
#        end do:
#In the MGCD code.

#UNLUCKY PRIMES
P:={2,3,5,7,11}; #this is as high as we need to go since it is larger the coeffs.
chk:=[seq( Gcd(abar,bbar) mod p, p in P)]:
map(x->degree(x,var), chk); #which means that 7 is a bad prime.
#We detetect unlucky primes by monitoring the degree of the current "guess" of the gcd. If the degree goes down we know that the previous calculation was garbage and we reset. Relfected by
#        if m<n then
#            P:=p:
#            H:=Cp:
#            n:=m:
#in the MGCD code.


#BAD EVALUTATION POINTS
#since 
lcoeff(a,[x,y]);
#there are no bad evaluation points.
#However since
lcoeff(a,x); #this means that y=0 will be a bad evaluation point.
#bad evaluations points are avoided by doing
#    g:=Gcd(lcA,lcB) mod p:
#        gb:=eval(g,xk=b) mod p:
#        while (gb=0) do
#            b:=b+1:
#            gb:=eval(g,xk=b) mod p: 
#        end do:
#In the PGCD code.


#UNLUCKY EVALUATION POINTS
#Consider the case where
p:=11;
chk:=[seq( Gcd(eval(abar,z=a),eval(bbar,z=a)) mod p, a=0..p-1)];
map(x->degree(x,var), chk); #which means that 0 and 1 are unlucky eval points
#We detetect unlucky evaluations by monitoring the degree of the current "guess" of the gcd. If the degree goes down we know that the previous calculation was garbage and we reset. Relfected by
#
#        if m<n then
#            qs:=b: Hs:=Cb: H:=0:
#            n:=m:
#In the PGCD code.

quit;