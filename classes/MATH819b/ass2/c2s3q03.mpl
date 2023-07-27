with(Groebner):

f:=x^7*y^2+x^3*y^2-y+1;

g1:=x*y^2-x;
g2:=x-y^3;

NormalForm(f,[g1,g2],plex(x,y));
NormalForm(f,[g2,g1],plex(x,y));

NormalForm(f,[g1,g2],grlex(x,y));
NormalForm(f,[g2,g1],grlex(x,y));

#These are consistent with my answers given in Question 1.