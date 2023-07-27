#ADDITIONAL QUESTION 2

with(Groebner):

Ga:=[y^3-z^2, x*z-y^2, x*y-z, x^2-y];
Gb:=[x*y-z^2, x*z-y^2, x*y-z, x^2-y];
Gc:=[x*z-y^2, x+y^2-z-1, x*y*z-1];
Gd:=[y^2-x^2*y, z-x*y, y-x^2];

ord:=grlex(x,y,z):

Basis(Ga,ord);
Basis(Gb,ord);
Basis(Gc,ord);
Basis(Gd,ord);

#Since reduced Groebner basis are unique Ga = Gb only when their corresponding
#groebner basis are equal as well.

#This means that the ideal's given in (a) and (d) are equivalent but no others.

quit;