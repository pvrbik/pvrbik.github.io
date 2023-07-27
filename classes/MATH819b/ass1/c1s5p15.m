#QUESTION 15

#(b)

f:=x^11-x^10+2*x^8-4*x^7+3*x^5-3*x^4+x^3+3*x^2-x-1;

factor(f);

fred:=quo(f, gcd(f,diff(f,x)), x);

factor(fred);


#(a)