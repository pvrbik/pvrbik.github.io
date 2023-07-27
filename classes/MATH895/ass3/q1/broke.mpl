#interface(quiet=true):
read "MGCD.mpl":

var:=[x,y]:

g:=x^4+7*x^2*y^4+1;
a:=g*(x-y):
b:=g*(x+y):
expand(a); expand(b);

MGCD(a,b,var);
