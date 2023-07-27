#QUESTION 17

#By a result give in 12b) of this section. I(V(f1,f2)) = <fred> so letting
f1:= x^5-2*x^4+2*x^2-x;
f2:=x^5-x^4-2*x^3+2*x^2+x-1;

f:=gcd(f1,f2);
fred:=quo(f, gcd(f,diff(f,x)), x);

#which means I(V(f1,f2)) = <f> = x^2-1
