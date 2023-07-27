#3.5 Question 10
#(check)

f:=a*x^2+b*x+c;
fp:=diff(f,x);

discf:=(-1)^(2*(2-1)/2)/a*resultant(f,fp,x):
expand(discf);

#also check using the built in command

discrim(f,x);

#So this check out.

quit: