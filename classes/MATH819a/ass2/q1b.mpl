a:=x^3-1:
b:=x^2+1:
c:=x^2:

g:=gcdex(a,b,x,'s','t'):

divide(c,g):

sigmaBar:=s*c/g;
tauBar:=t*c/g;

r:=rem(sigmaBar,b/g,x,'q'):

sigma:=r:

tau:=expand(tauBar+q*a/g):

evalb(degree(sigma,x)<degree(tau,x));
expand(sigma*a+tau*b); c;
