#4.3 Question 8

f:=x^4+x^3*y+x^3*z^2-x^2*y^2+x^2*y*z^2-x*y^3-x*y^2*z^2-y^3*z^2:
g:=x^4+2*x^3*z^2-x^2*y^2+x^2*z^4-2*x*y^2*z^2-y^2*z^4:
factor(f); factor(g);

#(a)
#Using Thm 11 
GB:=Groebner[Basis]( [ t*f,(1-t)*g], plex(t,x,y,z) ):
map(indets,GB);
#So <f> \int <g> = < GB[1] > where 
factor(GB[1]);

#Let's check using 4.3 Prop 13 where we have that if <f> \int <g> = <h> then h=LCM(f,g)
h:=factor(lcm(f,g));

# Rad( <f><g> ) = Rad( <fg> ) and by 4.2 Prop 12 we have that Rad( <fg> ) = < h > where
h:=convert(f*g,sqrfree);

#(b)

G:=gcd(f,g);
factor(G);

#(c)

p:=x^2+x*y+x*z+y*z;
q:=x^2-x*y-x*z+y*z;

GB:=Groebner[Basis]([t*f,t*g,(t-1)*p,(t-1)*q],plex(t,x,y,z));
map(indets,GB);
# <f,g> \intersect <p,q> = <GB[1],GB[2]> where
GB[1];GB[2];

quit:
