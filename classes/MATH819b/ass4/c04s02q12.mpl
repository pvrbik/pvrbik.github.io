#2.2 Question 12

f:=x^5+3*x^4*y+3*x^3*y^2-2*x^4*y^2+x^2*y^3-6*x^3*y^3-6*x^2*y^4+x^3*y^4-2*x*y^5+3*x^2*y^5+3*x*y^6+y^7;

factor(f);

#So f's square free part is given by (x-y^2)*(x+y)
#Which by Prop 9 means that Rad(<f>) = <(x-y^2)*(x+y)>

#We can also do this by Prop 12 as a check.

GCD:=xs->foldr(gcd,0,op(xs)):

factor(GCD([f, diff(f,x) , diff(f,y)]));

#so this is consistent with the results given above.

quit:
