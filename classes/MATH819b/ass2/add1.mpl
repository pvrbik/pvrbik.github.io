#ADDITION QUESTION 1
#The read file common.mpl is on the next page.
read "common.mpl":

#GRLEX ORDERING
var:=[x,y]:
MkPoly(sort(AllPoly(3,var), grlex),var);

var:=[x,y,z]:
MkPoly(sort(AllPoly(3,var), grlex),var);


#GREVLEX ORDERING
var:=[x,y]:
MkPoly(sort(AllPoly(3,var), grevlex),var);

var:=[x,y,z]:
MkPoly(sort(AllPoly(3,var), grevlex),var);


quit: