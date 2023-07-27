interface(quiet=true):

#BEZIER CURVES

X:=( (1-t)^2*x[1]+2*t*(1-t)*w*x[2]+t^2*x[3] ) / ((1-t)^2+2*t*(1-t)*w+t^2);

Y:=( (1-t)^2*y[1]+2*t*(1-t)*w*y[2]+t^2*y[3] ) / ( (1-t)^2+2*t*(1-t)*w+t^2);

Xp:=diff(X,t):
Yp:=diff(Y,t):

x0:=(eval(Xp,t=0)):
x1:=(eval(Xp,t=1)):

y0:=(eval(Yp,t=0)):
y1:=(eval(Yp,t=1)):


xp0:=factor(expand(x0));
yp0:=factor(expand(y0));


xp1:=factor(expand(x1));
yp1:=factor(expand(y1));



