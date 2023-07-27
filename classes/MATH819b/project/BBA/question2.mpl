read "common.mpl":
read "BBA.mpl":

SHOW:=proc(inG,LT)
local G:
    G:=convert(inG,list):
    printf("        LT(G)=%a\n",sort(map(LT,G))):
end proc:

###########
#Problem 2#
###########

var:=[x,y,z]:
f1:= 4*x^2 + x*y^2 - z +1/3;
f2:= 2*x + y^2*z + 1/2;
f3:= x^2*z - 1/2*x - y^2;

G:=[f1,f2,f3]:

#LEX ORDER
ord:=plex(op(var));
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(G,LT):
SHOW(G,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);

#GRADED ORDER
ord:=grlex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(G,LT):
SHOW(G,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);

#TOTAL DEGREE
ord:=tdeg(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(G,LT):
SHOW(G,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);

quit:
