#QUESTION 16f supplement

xm:= 1/2*(x1+x3);
ym:= 1/2*(y1+y3);

#we can rewrite x(1/2)=xh , y(1/2)=yh

xh:= (xm+w*x2)/(1+w);
yh:= (ym+w*y2)/(1+w);

f:=simplify(expand((xm-xh)^2+(ym-yh)^2)):
g:=simplify(expand((x2-xh)^2+(y2-yh)^2)):

f/g;