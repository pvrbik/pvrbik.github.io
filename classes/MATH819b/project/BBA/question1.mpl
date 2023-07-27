read "common.mpl":
read "BBA.mpl":

SHOW:=proc(inG,LT)
local G:
    G:=convert(inG,list):
    printf("        LT(G)=%a\n",sort(map(LT,G))):
end proc:

###########
#Problem 1#
###########

var:=[x,y,z]:
f1:=3*x-6*y-2*z;
f2:=2*x-4*y+4*w;
f3:=x-2*y-z-w;

G:=[f1,f2,f3]:

#LEX ORDER
ord:=plex(op(var));
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(G,LT,true):
SHOW(G,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);

quit: