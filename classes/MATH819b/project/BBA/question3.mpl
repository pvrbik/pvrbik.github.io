read "common.mpl":
read "BBA.mpl":

#interface(quiet=true):

SHOW:=proc(inG,LT)
local G:
    G:=convert(inG,list):
    printf("        LT(G)=%a\n",sort(map(LT,G))):
end proc:


###########
#Problem 3#
###########

var:=[u0,u1,u2,u3]:
f1:= u0^2 - u0 + 2*u1^2 + 2*u2^2 + 2*u3^2;
f2:= 2*u0*u1 + 2*u1*u2 + 2*u2*u3 - u1;
f3:= 2*u0*u2 + u1^2 + 2*u1*u3 - u2;
f4:= u0 + 2*u1 + 2*u2 + 2*u3 -1;

G:=[f1,f2,f3,f4]:

#LEX ORDER
ord:=plex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):


GB:=BBA(G,LT):
SHOW(GB,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);



#GRADED ORDER

ord:=grlex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):


GB:=BBA(G,LT):
SHOW(GB,LT);
chk:=Groebner:-Basis(G,ord):
SHOW(chk,LT);


#TOTAL DEGREE
ord:=tdeg(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

GB:=BBA(G,LT):
SHOW(GB,LT);
#chk:=Groebner:-Basis(G,ord):
#SHOW(chk,LT);

quit:
