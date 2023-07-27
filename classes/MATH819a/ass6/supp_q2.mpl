#- - - This is for function 1- - -
f1:=x^2/(x-1)^3/(x^2-2);
#hermite reduction
t1:=hermite(f1);
#trager rothstein on log part
logpart:=op([3,1],t1);
t2:=tragRoth( logpart ):
t3:=simplify(diff(t2,x));

ans:=foldr((x,y)->x+y,op([1..2],t1));
ans:=simplify(diff(ans,x)+t3);

#- - - This is for function 2
f2:=(4*x^7-16*x^6+28*x^5-351*x^3+588*x^2-738)/(2*x^7-8*x^6+14*x^5-40*x^4+82*x^3-76*x^2+120*x-144):

t1:=hermite(f2);

logpart:=op([4,1],t1);

#trace(tragRoth);

t2:=tragRoth( logpart );

t3:=diff(t2,x):
t3:=simplify(expand(t3)):
factor(simplify(numer(t3))/expand(denom(t3)));



#- - - function 3  - - -
f3:=(6*x^5-4*x^4-32*x^3+128*x^2+34*x-24)/(x^6-8*x^4+17*x^2-8);
int(f3,x);
hermite(f3);
#trace(tragRoth);
t:=simplify(tragRoth(f3)):

t3:=diff(t,x):
t3:=simplify(expand(t3)):
factor(simplify(numer(t3))/expand(denom(t3)));
