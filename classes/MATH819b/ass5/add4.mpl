#Additional 4

with(Groebner):
with(PolynomialIdeals):

#(i)
I:=<x^3+1>; IsPrime(I); IsMaximal(I);

#(ii)
I:=<x^4+1>; IsPrime(I); IsMaximal(I);

#(iii)
I:=<x^2+1,(variables={x,y})>; IsPrime(I); IsMaximal(I);

#(iv)
I:=<x^2+1,y^2+1>; IsPrime(I); IsMaximal(I);

#(v)
I:=<x^2+1,y^2>; IsPrime(I); IsMaximal(I);

quit:
