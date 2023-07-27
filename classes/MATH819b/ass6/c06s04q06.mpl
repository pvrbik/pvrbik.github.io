################
#6.4 Question 6#
################
with(Groebner):
with(PolynomialIdeals):
 
#Hypothesis / Restrictions
h1:=2*x3-u2;
h2:=2*y3-u3;
h3:=2*x2-u1;
h4:=y2;
h5:=2*x1-u2-u1;
h6:=2*y1-u3;
h7:=x1*y4 - x4*y1;
h8:=y3*(x4-u1)-y4*(x3-u1);
 
#Conclusion
g:= (u3-y2)*(x4-x2)-(y4-y2)*(u2-x2);

I:=[h1,h2,h3,h4,h5,h6,h7,h8,1-t*g];
G:=Basis(I, plex(t,x1,x2,x3,x4,y1,y2,y3,y4) );

#So here we have that the conclusion follows GENERICALLY from the hypothesis.
quit:
