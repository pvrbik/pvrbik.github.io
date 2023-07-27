read "add3common.mpl":

#Sec 2.3 Question 1 a)
var:=[x,y]:

g1:=x*y^2-x;
g2:=x-y^3;

f:=x^7*y^2+x^3*y^2-y+1;

qs:=Division(f,[g1,g2],LTlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2], plex(x,y) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[-1]);

qs:=Division(f,[g1,g2],LTgrlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2], grlex(x,y) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[-1]);

qs:=Division(f,[g1,g2],LTgrevlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2], tdeg(x,y) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[-1]);


#Sec 2.3 Question 1 a)
var:=[x,y]:

g2:=x*y^2-x;
g1:=x-y^3;

f:=x^7*y^2+x^3*y^2-y+1;

qs:=Division(f,[g1,g2],LTlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2], plex(x,y) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[-1]);

qs:=Division(f,[g1,g2],LTgrlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2], grlex(x,y) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[-1]);

qs:=Division(f,[g1,g2],LTgrevlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2], tdeg(x,y) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[-1]);

#Sec 2.3 Question 2 a)
printf("Sec 2.3 Question 2 a)");
var:=[x,y,z]:

g1:=x-y^2:
g2:=y-z^3:
g3:=z^2-1:

f:=x*y^2*z^2+x*y-y*z:

printf("LEX \n"):
qs:=Division(f,[g1,g2,g3],LTlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], plex(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);

printf("GRLEX \n"):
qs:=Division(f,[g1,g2,g3],LTgrlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], grlex(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);

printf("GREVLEX \n"):
qs:=Division(f,[g1,g2,g3],LTgrevlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], tdeg(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);


#Sec 2.3 Question 2 b)
printf("Sec 2.3 Question 2 b)");
var:=[x,y,z]:

g3:=x-y^2:
g1:=y-z^3:
g2:=z^2-1:

f:=x*y^2*z^2+x*y-y*z:

printf("LEX \n"):
qs:=Division(f,[g1,g2,g3],LTlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], plex(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);

printf("GRLEX \n"):
qs:=Division(f,[g1,g2,g3],LTgrlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], grlex(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);

printf("GREVLEX \n"):
qs:=Division(f,[g1,g2,g3],LTgrevlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], tdeg(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);

#Sec 2.3 Question 2 c)
printf("Sec 2.3 Question 2 c)");
var:=[x,y,z]:

g2:=x-y^2:
g3:=y-z^3:
g1:=z^2-1:

f:=x*y^2*z^2+x*y-y*z:

printf("LEX \n"):
qs:=Division(f,[g1,g2,g3],LTlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], plex(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);

printf("GRLEX \n"):
qs:=Division(f,[g1,g2,g3],LTgrlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], grlex(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);

printf("GREVLEX \n"):
qs:=Division(f,[g1,g2,g3],LTgrevlex):
r:=qs[-1];
Groebner[NormalForm](f,[g1,g2,g3], tdeg(x,y,z) );
expand(f - qs[1]*g1 - qs[2]*g2 - qs[3]*g3 - qs[-1]);
