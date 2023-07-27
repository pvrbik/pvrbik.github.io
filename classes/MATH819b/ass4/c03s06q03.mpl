#3.6 Question 3 (appendix)

#(A)

f:=x*y-1;
g:=x^2+y^2-4;

resultant(f,g,x);

Groebner[Basis]([f,g],plex(x,y));

#(B)

f:=x*y-1;
g:=y*x^2+y^2-4;

resultant(f,g,x);

Groebner[Basis]([f,g],plex(x,y));

quit:
