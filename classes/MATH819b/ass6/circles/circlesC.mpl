#########
#Circles#
#########
#Part C##
#########
with(Groebner):
with(PolynomialIdeals):

#####################
#Boundary Conditions#
#####################
for i in {1,2,3} do
    x[i]:=0:
end do:

for i in {9,10} do
    x[i]:=1:
end do:

for i in {1,4,9} do
    y[i]:=0:
end do:

for i in {6,8} do
    y[i]:=1:
end do:

x[4]:=m:
y[2]:=m:
x[8]:=x[6]+m:

##########
#Symmetry#
##########
sym:=proc(pt) local i,j: i,j:=pt[1],pt[2]: return x[i]-y[j] end proc:
SymEqns:=map(sym, {[4,2]} );

############
#Pythagoras#
############
pyth:=proc(pt) local i,j: i,j:=pt[1],pt[2]: return (x[i]-x[j])^2 + (y[i]-y[j])^2 - m^2: end proc:
PythEqns:=map(pyth, {[4,7],[7,9],[7,10],[8,10],[2,5],[5,7],[6,5]});

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

solns:=[fsolve(f)];

m:=min(op(select(type,solns,positive)));
#which means
r:=m/(2*m+2);
#which is consistent with the literature.


quit:
