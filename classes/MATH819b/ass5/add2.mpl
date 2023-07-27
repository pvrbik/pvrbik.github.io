#Additional 2

f:=x^5+3*x^4*y+3*x^3*y^2-2*x^4*y^2+x^2*y^3-6*x^3*y^3-6*x^2*y^4+x^3*y^4-2*x*y^5+3*x^2*y^5+3*x*y^6+y^7:
fx:=diff(f,x):
fy:=diff(f,y):

#To get g1=gcd(f,fx) we apply Thm 11
G:=Groebner[Basis]([t*f,(1+t)*fx],plex(t,x,y)):
map(indets,G);
#by Prop 9 this is the LCM of f and fx
LCM:=G[1];
#so the gcd of f and fx is:
g1:=simplify(f*fx/LCM);

#To get g = gcd(g1,fy) = gcd(f,fx,fy) we apply Thm 11
G:=Groebner[Basis]([t*g1,(1+t)*fy],plex(t,x,y)):
map(indets,G);
#by Prop 9 this is the LCM of gcd(f,fx) and fy
LCM:=G[1];
#so the gcd of gcd(f,fx) and fy is:
g:=simplify(g1*fy/LCM);

#let us check the result
eval(GCD);
GCD(f,fx,fy);
#(this will only be equal upto a scalar

quit:

