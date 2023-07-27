################
#6.4 Question 8#
################
with(Groebner):
with(PolynomialIdeals):
 
#Hypothesis / Restrictions
h1:=x2*(u6-x3)-x3*(u5-x2);
h2:=x3*(u3-x2)-(x2-u1)*(u4-x3);
h3:=x4*(x1-x5)-(u7-x4)*x5;
h4:=(u3-x4)*x5-(x4-u2)*(u4-x5);
h5:=(x6-u1)*(x1-x7)-(u7-x6)*x7;
h6:=(x6-u2)*(u6-x7)-(u5-x6)*x7;
h7:=(u3-u7)*(u6-x1)-(u5-u7)*(u4-x1);
 
#Conclusion
g:=(x2-x6)*(x5-x7)-(x4-x6)*(x3-x7);

I:=[h1,h2,h3,h4,h5,h6,h7,1-t*g];
G:=Basis(I, plex(t,x1,x2,x3,x4,x5,x6,x7) );

#So here we have that the conclusion follows GENERICALLY from the hypothesis.
quit:
