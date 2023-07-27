#########
#Circles#
#########
#Part B##
#########
with(Groebner):
with(PolynomialIdeals):

#####################
#Boundary Conditions#
#####################
for i in {2} do
    x[i]:=0:
end do:

for i in {9,10} do
    x[i]:=1:
end do:

for i in {6,1} do
    y[i]:=0:
end do:

for i in {3,8} do
    y[i]:=1:
end do:

##########
#Symmetry#
##########
sym:=proc(pt) local i,j: i,j:=pt[1],pt[2]: return x[i]-y[j] end proc:
SymEqns:=map(sym, {[8,10],[3,9],[6,2],[7,5],[5,7],[4,4]} );

############
#Pythagoras#
############
pyth:=proc(pt) local i,j: i,j:=pt[1],pt[2]: return (x[i]-x[j])^2 + (y[i]-y[j])^2 - m^2: end proc:
PythEqns:=map(pyth, {[1,4],[6,4],[4,7],[6,7],[6,9],[9,7],[7,10],[5,7],[8,10]});

#######
#Solve#
#######
I:=SymEqns union PythEqns;

tmp:={seq(x[i],i=1..10),seq(y[i],i=1..10)};
tmp:=select(type,tmp,indexed);
ord:=lexdeg(convert(tmp,list),[m]);

G:=Basis(I,ord):
map(indets,G);

#So we need the roots of the first polynomial:
f:=G[1];
f:=factor(f);
#We reject m since m <> 0.

f:=op(f)[2];

solns:=[fsolve(f)];

m:=min(op(select(type,solns,positive)));
#which means
r:=m/(2*m+2);
#which is consistent with the literature.


quit:
