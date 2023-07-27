read "common.mpl":
read "BBA.mpl":

interface(quiet=true):

SHOW:=proc(inG,LT)
local G:
    G:=convert(inG,list):
    printf("        LT(G)=%a\n",sort(map(primpart,map(LT,G)))):
end proc:

###########
#Problem 4#
###########
f1:= 45*p + 35*s - 165*b - 36:
f2:= 35*p + 40*z + 25*t - 27*s:
f3:= 15*w + 25*p*s + 30*z - 18*t - 165*b^2:
f4:= -9*w + 15*p*t + 20*z*s:
f5:= w*p + 2*z*t - 11*b^3:
f6:= 99*w - 11*s*b + 3*b^2:

I:=[f1,f2,f3,f4,f5,f6]:
var:=[b,p,s,t,w,z];

#GRADED ORDER
ord:=grlex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=BBA(I,LT):
SHOW(G,LT);
chk:=Groebner:-Basis(I,ord):
SHOW(chk,LT);

#LEX ORDER
ord:=plex(op(var));
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=timelimit(60*20,BBA(I,LT) ):
if G=0 then printf(" %a took over 20 minutes \n", var): end if:

#   #   #   #   #   #   #   #
I:=[f1,f2,f3,f4,f5,f6]:
var:=[z,w,t,s,p,b];

#GRADED ORDER
ord:=grlex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

st:=time():
G:=BBA(I,LT):
time()-st;
SHOW(G,LT);
chk:=Groebner:-Basis(I,ord):
SHOW(chk,LT);

#LEX ORDER
ord:=plex(op(var));
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

G:=timelimit(60*20,BBA(I,LT) ):
if G=0 then printf(" %a took over 20 minutes \n", var): end if:

#   #   #   #   #   #   #   #
I:=[f1,f2,f3,f4,f5,f6]:
var:=[z,b,w,p,t,s];

#GRADED ORDER
ord:=grlex(op(var)):
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

st:=time():
G:=BBA(I,LT):
time()-st;
SHOW(G,LT);
chk:=Groebner:-Basis(I,ord):
SHOW(chk,LT);

#LEX ORDER
ord:=plex(op(var));
LT:=f->`*`(Groebner[LeadingTerm](f,ord)):

st:=time():
G:=timelimit(60*20,BBA(I,LT) ):
time()-st;
if G=0 then printf(" %a took over 20 minutes \n", var): end if:

quit: