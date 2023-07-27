read "procs.mpl":
read "CRT.mpl":

q:=3;
abar:=t^3*x^5-t^6*x^2+1;
bbar:=t^2*x^4+x^2+t^7;
g:=x^5*(t^3-t)+x;
a:=g*abar;
b:=g*bbar;


q:=3:
g := (t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1;
abar := t*x^5-t^6*x^2+1;
bbar := t*x^4+x^2+t^7;

a:=abar*g:
b:=bbar*g:

#a := collect(expand(g*a_bar),x); b := collect(expand(g*b_bar), x);
#a := expand(g*a_bar); b := expand(g*b_bar);

#trace(fModGcd);
fModGcd(a,b,q);
myGcd(a,b,q);

quit();