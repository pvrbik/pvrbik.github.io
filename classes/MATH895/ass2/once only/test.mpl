read "SDMP.mpl":

var:=[x,y,z]:
f:=randpoly(var);
g:=randpoly(var);

F:=Maple2Smp(f,var);
G:=Maple2Smp(g,var);

f2:=SMP2Maple(F,var);
g2:=SMP2Maple(G,var);

expand(f-f2);
expand(g-g2);

H:=SMPadd(F,G);

h:=SMP2Maple(H,var);

expand(h-f-g);
