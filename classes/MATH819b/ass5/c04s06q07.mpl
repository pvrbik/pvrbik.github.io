#4.6 Question 7

with(Groebner):
with(PolynomialIdeals):

I:=<x*z-y^2,z^3-x^5>;

#Part (a)
#We use the paratremizations in the hint we get
J:=Basis( [x-t^3, y-t^4, z-t^5], `lexdeg`([t],[x,y,z])):
J:=remove(has,J,t):
J:=<op(J)>;

K:=Basis( [x-t^3,y+t^4,z-t^5], `lexdeg`([t],[x,y,z])):
K:=remove(has,K,t):
K:=<op(K)>;

#Where I = J \intersect K We check this:
Simplify(I);
Simplify(Intersect(J,K));

#So we have that V(I) = V(J \intersect K) = V(J) \union V(K).
#Since V(J) = { (t^3,t^4,t^5), t in R } (it was constructed to do this) 
#and similarily V(K) = { (t^3,-t^4,t^5) , t in R }, Prop 6 says that
#V(J) and V(K) are irreducible since they are definened parametrically.
#This means we have the desired decomposition into irreducible varieties.

#Part (b)

#4.5 Prop 3 gives that I(V(J)) and I(V(K)) are prime ideals sinve V(J), V(K)
#are irreducible.

#By our construction it is not hard to see I(V(J))=J and I(V(K))=K which mean
#J and K are also prime.

IsRadical(J); IsRadical(K);

#Since the intersection of two radical ideal is radical we have that I is 
#also radical.

Quotient( I, K );
Quotient( I, J );

#So we also have that I:J=K and I:K=J.
#We conclude that I = J \intersect K is the desired decomposition
#into primpe ideals that are ideal quotients of I.

#We verified that I = J \intersect K above.

quit: