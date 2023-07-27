#######
#Add 2#
#######
with(PolynomialIdeals):

I:=<x^2-y^2+1>;
IsPrime(I);
IsMaximal(I);
#Q[x,y]/I is (by Add1):
#IS an integral domain
#NOT a field


I:=<x^2+y^2+1,y^2+1>;
IsPrime(I);
IsMaximal(I);
#Q[x,y]/I is (by Add1):
#NOT an integral domain
#NOT a field


I:=<x^2-2,y+1>;
IsPrime(I);
IsMaximal(I);
#Q[x,y]/I is (by Add1):
#IS an integral domain
#IS a field


quit:
