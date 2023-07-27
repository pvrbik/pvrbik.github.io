#QUESTION 1 (A)
#PART ii

var:=[x,y,z];
a:=(x+y*z+1)*(y*x+y+7*z);
b:=(x+y*z+1)*(y*x^2+7*z*x+y);
g:=gcd(a,b);
abar:=a/g;
bbar:=b/g;

#UNLUCKY CONTENT (PRIMES)
P:={2,3,5,7,11}; #this is as high as we need to go since it is larger the coeffs.
chk:=[seq( gcd(Content(abar,x) mod p,Content(bbar,x) mod p), p in P)];
map(x->degree(x,var), chk); #which means that 7 is a prime that introduces bad unlucky content.

#UNLUCKY CONTENT (EVALUATION POINTS)
fncA:=alpha->content(eval(abar,z=alpha),x):
fncB:=alpha->content(eval(bbar,z=alpha),x):

#We notice that evaluating at z=0 introduces a common factor of y. We verify that
degree(gcd(fncA(0), fncB(0)));
#which means that z=0 is an evaluation point which introduces unlucky content.


#We detetect unlucky content by monitoring the degree of the current "guess" of the gcd. If the degree goes down we know that the previous calculation was garbage and we reset.


quit:

