interface(quiet=true):
read "SprInterp.mpl":
read "zipp.mpl":

var:=[x,u,v,w,y,z]:
g:=2*x^8 + (u^8*v - 3*v^8*y + y^8*u)*x^4 + (w^8*z - 3*z^8*w + 1):c:=4*x^8 + 5*w^4*x^4 + 2*y^4*z^4 + 3*u^4*v^4 + 1:d:=6*x^8 - 5*y^4*x^4 - 4*u^4*v^4 - 3*w^4*z^4 - 2:a:=expand(g*c):wb:=expand(g*d):

X:=[x,u,v,w]:
Y:=y:
Z:=z:

p:=11;
g:=Mgcd( eval(a,Z=3), eval(b,Z=3), p, x):

sort(collect(g,x));

#trace(AssForm);

Gf,Ind:=AssForm(g,var);

print(Gf);

az:=eval(a,z=2):
bz:=eval(b,z=2):

#trace(sprInterp);
c1:=sprInterp(az,bz,Gf,Ind,p,var[1..-2]);
c2:=Mgcd(az,bz,p,x):

sort(collect(c1,x,distributed));
sort(collect(c2,x,distributed));

quit: