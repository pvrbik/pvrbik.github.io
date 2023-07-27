interface(quiet=true):
#read "sulingMGCD.mpl";
read "MGCD.mpl":

# test:
`mod` := mods;
c := x^3+y^3+z^3+1;  d := x^3-y^3-z^3+1;
g := x^4-123454321*y*z^2*x^2+1;

g := z*y*x^3+1;  c := (z-1)*x+y+1;  d := (z^2-1)*x+y+1;
MGCD(expand(g*c),expand(g*d),[x,y,z]);