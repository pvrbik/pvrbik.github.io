read "add2common.mpl":

#SECTION 2.3 
#QUESTION 1

#LEX

var:=[x,y]:

#My solution uses the division algorithm I designed for ADDITION QUESTIONAL 3
#Division returns a list in the form of [q1,...,qn,r]
#I have printed the intermediate f's

#(A)
f:=x^7*y^2 + x^3*y^2 - y +1:
g1:=x*y^2-x:
g2:=x-y^3:
qs:=Division(f,[g1,g2],LTlex);

#(B)
f:=x^7*y^2 + x^3*y^2 - y +1:
g2:=x*y^2-x:
g1:=x-y^3:
qs:=Division(f,[g1,g2],LTlex);

