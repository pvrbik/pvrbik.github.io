#ADDITION QUESTION 2
#interface(quiet=true):

read "common.mpl":
read "BBA.mpl":

SHOW:=proc(inG,LT)
local G:
    G:=convert(inG,list):
    printf("        LT(G)=%a\n",map(LT,G)):
end proc:

###########
#Problem 1#
###########

var:=[x,y]:
f1:=x*y-1:
f2:=x*z-1:


#LEX ORDER
G:=BBA([f1,f2],LTlex);
SHOW(G,LTlex):

chk:=Groebner:-Basis([f1,f2],plex(x,y)):
SHOW(chk,LTlex):


#GRLEX ORDER
G:=BBA([f1,f2],LTgrlex);
SHOW(G,LTgrlex):

chk:=Groebner:-Basis([f1,f2],grlex(op(var))):
SHOW(chk,LTgrlex):

###########
#Problem 2#
###########

var:=[w,x,y,z]:
f1:=3*x-6*y-2*z:
f2:=2*x-4*y+4*w:
f3:=x-2*y-z-w:

#LEX ORDER
G:=BBA([f1,f2,f3],LTlex);
SHOW(G,LTlex):

chk:=Groebner:-Basis([f1,f2,f3],plex(op(var))):
SHOW(chk,LTlex):


#GRLEX ORDER
G:=BBA([f1,f2,f3],LTgrlex);
SHOW(G,LTgrlex):

chk:=Groebner:-Basis([f1,f2,f3],grlex(op(var))):
SHOW(chk,LTgrlex):

###########
#Problem 3#
###########

var:=[x,y,z]:
f1:=x^2+y+z-1:
f2:=x+y^2+z-1:
f3:=x+y+z^2-1:

#LEX ORDER
G:=BBA([f1,f2,f3],LTlex);
SHOW(G,LTlex);

chk:=Groebner:-Basis([f1,f2,f3],plex(op(var))):
SHOW(chk,LTlex);

#GRLEX ORDER
G:=BBA([f1,f2,f3],LTgrlex);
SHOW(G,LTgrlex);

chk:=Groebner:-Basis([f1,f2,f3],grlex(op(var))):
SHOW(chk,LTgrlex);

###########
#Problem 4#
###########

var:=[x,y,z]:
f1:=x-z^4:
f2:=y-z^5:

#LEX ORDER
G:=BBA([f1,f2],LTlex);
SHOW(G,LTlex);

chk:=Groebner:-Basis([f1,f2],plex(op(var))):
SHOW(chk,LTlex);

#GRLEX ORDER
G:=BBA([f1,f2],LTgrlex);
SHOW(G,LTgrlex);

chk:=Groebner:-Basis([f1,f2],grlex(op(var))):
SHOW(chk,LTgrlex);

###########
#Problem 5#
###########

var:=[t,x,y,z]:
f1:=t^2+x^2+y^2+z^2:
f2:=t^2+2*x^2-x*y-z^2:
f3:=t+y^3-z^3:

#LEX ORDER
G:=BBA([f1,f2,f3],LTlex);
SHOW(G,LTlex);

chk:=Groebner:-Basis([f1,f2,f3],plex(op(var))):
SHOW(chk,LTlex);

#GRLEX ORDER
G:=BBA([f1,f2,f3],LTgrlex);
SHOW(G,LTgrlex);

chk:=Groebner:-Basis([f1,f2,f3],grlex(op(var))):
SHOW(chk,LTgrlex);

quit: