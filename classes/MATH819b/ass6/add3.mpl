#######
#Add 3#
#######
with(PolynomialIdeals):
with(Groebner):

#USING PLEX
I:=< x^2+y+z-1, x+y^2+z-1, x+y+z^2-1 >;
G:=Basis(I, plex(x,y,z) );
LeadingMonomial(G, plex(x,y,z) );

#The monomial basis for C[x,y,z] \ I will be given by {1,y,z,z^2,z^3,z^4,z^5,yz}
#By Proposition 4 we have that C[x,y,z] \ I is isomorphic to the
#span(1,y,z,z^2,z^3,z^4,z^5,yz) which has dimension 8. 

#Prop 8i says that the number of points in V(I) is at MOST 8.  (TRUE because V(I) has five points).

J:=Radical(I);
GG:=Basis(J,plex(x,y,z));
LeadingMonomial(GG, plex(x,y,z) );

#The monomial basis for C[x,y,z] \ I will be given by {1,y,z,z^2,z^3}
#By Proposition 4 we have that C[x,y,z] \ I is isomorphic to the
#span(1,y,z,z^2,z^3) which has dimension 5. 

#Sine J is a radical ideal Prop 5ii says that V(I) should have EXACTLY five points. (TRUE)


#USING TDEG
I:=< x^2+y+z-1, x+y^2+z-1, x+y+z^2-1 >;
G:=Basis(I, tdeg(x,y,z) );
LeadingMonomial(G, tdeg(x,y,z) );

#The monomial basis for C[x,y,z] \ I will be given by {1,x,y,z,xy,xz,yz,xyz}
#By Proposition 4 we have that C[x,y,z] \ I is isomorphic to the
#span(1,x,y,z,xy,xz,yz,xyz) which has dimension 8. 

#Prop 8i says that the number of points in V(I) is at MOST 8.  (TRUE because V(I) has five points).

J:=Radical(I);
GG:=Basis(J,tdeg(x,y,z));
LeadingMonomial(GG, tdeg(x,y,z) );

#The monomial basis for C[x,y,z] \ I will be given by {1,x,y,z,yz}
#By Proposition 4 we have that C[x,y,z] \ I is isomorphic to the
#span(1,x,y,z,yz) which has dimension 5. 

#Sine J is a radical ideal Prop 5ii says that V(I) should have EXACTLY five points. (TRUE)

quit:
