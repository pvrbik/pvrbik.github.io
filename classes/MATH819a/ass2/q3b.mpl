a:=2*x^3-(y+1)*x^2-x+y:
b:=(y+2)*x^2-2*x+y:
delta:=degree(a,x)-degree(b,x)+1:
m:=lcoeff(b,x)^delta:
pr:=rem(m*a,b,x,'pq'):

#pseudo remainder
pr;

#pseudo quotient
pq;

