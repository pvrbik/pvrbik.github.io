interface(quiet=true):
read "MGCD.mpl":

#trace(MGCD);
#Question 1 (B)
#PartI
c:=x^3+y^3+z^3+1: d:=x^3-y^3-z^3+1:g:=x^4-123454321*y*z^2*x^2+1:MGCD(c,d,[x,y,z]);MGCD(expand(g*c),expand(g*d),[x,y,z]);
MGCD(expand(g^2*c),expand(g^2*d),[x,y,z]);

#PartII
g:=z*y*x^3+1: c:=(z-1)*x+y+1: d := (z^2-1)*x+y+1:MGCD(expand(g*c),expand(g*d),[x,y,z]);

#PARTIII
g:=x^4+z^2*y^2*x^2+1: c:=x^4+z*y*x^2+1: d:=x^4+1:MGCD(expand(g*c),expand(g*d),[x,y,z]);

#PARTIV
g:=x^4+z^2*y^2*x^2+1: c:=z*x^4+z*x^2+y: d:=z*x^4+z^2*x^2+y:MGCD(expand(g*c),expand(g*d),[x,y,z]);