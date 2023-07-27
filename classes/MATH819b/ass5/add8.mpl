#Additional 8

with(Groebner):
with(PolynomialIdeals):

IC:=IdealContainment:
IdealEqual:=(I,J)->IC(I,J) and IC(J,I):

g:=y^5+y^3*z+y^3-3*y^4*z-3*y^2*z^2-3*y^2*z+3*y^3*z^2+3*y*z^3+3*y*z^2-z^3*y^2-z^3+6-5*z^2:

I:=<(z^2-2)*(z^2-3),g>:
J:=<(z^2-2),g>:
K:=<(z^2-3),g>:

#Notive that V(I) = V(J) U V(K) which means that,
#I(V(I)) = I(V(J)) \intersect I(V(K))
#So if we determine the radicals of I(V(J)) and I(V(K)) we get the solution.

alias(alpha=RootOf(z^2-2)):
gr:=subs(z=alpha,g):
factor(gr);
#we identify z with alpha and take the square free part
RadJ:=Simplify(<J,(y^2+1+z)*(y-z)>);
IdealEqual(Radical(J),RadJ);


alias(beta=RootOf(z^2-3)):
gr:=subs(z=beta,g):
factor(gr);
#we identify z with beta and take the square free part
RadK:=Simplify(<K,(y^2+1+z)*(y-z)>);
IdealEqual(Radical(K),RadK);

#So we have that Rad(I) = RadJ \intersect RadK
RadI:=(Intersect(RadJ,RadK));

#check
IdealEqual( Radical(I), RadI );
IdealEqual( <-(y^2+1+z)*(-y+z), (z^2-2)*(z^2-3)>, Radical(I) );

#"TIDY" FINAL ANSWER
RadI:=factor(Basis(RadI,plex(x,y,z)));

quit:

