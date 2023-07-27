#QUESTION 8

#GCD:=proc(xs):
#    if nops(xs)=1 then return xs[1]: end if:
#    return gcd( xs[1], GCD(xs[2..-1])):
#end proc:

GCD:=xs->foldr(gcd,0,op(xs)):

GCD([x^4+x^2+1, x^4-x^2-2*x-1, x^3-1]);

GCD([x^3+2*x^2-x-2, x^3-2*x^2-x+2, x^3-x^2-4*x+4]);

#QUESTION 9

f1:=x^3+x^2-4*x-4;
f2:=x^3-x^2-4*x+4;
f3:=x^3-2*x^2-x+2;

#this is the generator for <f1,f2,f3>
f:=GCD([f1,f2,f3]);

divide( x^2-4, f, 'r' );

#Since x^2-4 = (x+2)(x-2) = (x+2)*f we have that x^2 \in <f1,f2,f3>
