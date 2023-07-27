interface(quiet=true):
a:=(9*y-7)*x +12:
b:=(13*y+23)*x^2 + (21*y-11)*x + (11*y-13):

f:=(p)-> collect(expand(a*b) mod p,x):

`mod`:=mods:
ps:=[3,5,7,11,13,17,23,29];
P:=mul(ps[i],i= 1..nops(ps)):
collect(expand(chrem(map(f,ps),ps )),x) mod P;

collect(expand(a*b),x);

quit