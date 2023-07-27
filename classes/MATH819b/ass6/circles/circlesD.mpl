#########
#Circles#
#########
#Part D##
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

for i in {4,8} do
    y[i]:=0:
end do:

for i in {3,7} do
    y[i]:=1:
end do:

y[10]:=m+y[9]:
y[2]:=m+y[1]:
y[6]:=y[9]:
x[8]:=m+x[4]:
x[5]:=1/2*x[7]:
x[6]:=1-m:
y[2]:=2*y[5]-1:
y[1]:=2*y[5]-1-m:

##########
#Symmetry#
##########
#NONE
SymEqns:={};

############
#Pythagoras#
############
pyth:=proc(pt) local i,j: i,j:=pt[1],pt[2]: return (x[i]-x[j])^2 + (y[i]-y[j])^2 - m^2: end proc:
PythEqns:=map(pyth, {[1,2],[1,4],[2,5],[3,5],[4,6],[4,8],[5,6],[5,7],[6,9],[8,9],[9,10],[7,10]});

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
