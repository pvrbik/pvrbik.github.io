#3.6 Question 4 (Appendix)

f:=x->x^2-2;
g:=x->x^2-3;

#have roots sqrt(2) and sqrt(3) respectively.

#By the above consturction

h:=resultant( f(x), g(y-x), x); 

#should have sqrt(2)+sqrt(3) as a root (let's check)

expand(eval(h,y=sqrt(2)+sqrt(3)));

quit:
