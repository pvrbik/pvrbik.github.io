#interface(quiet=true):
read "add2common.mpl":

var:=[x,y,z];

#Section 2.6
#Qustion 2

#This code uses the division algorithm I designed for addition question 3.

#(a)
G:=[x+z, y-z];
f:=x*y;

t:=Division(f,G,LTlex):
qs1:=t[1..-2];
r1:=t[-1];

#(b)
G:=[y-z, x+z];
f:=x*y;

t:=Division(f,G,LTlex);
qs2:=t[1..-2];
r2:=t[-1];

r1=r2;
#As expected the remainders are the same

quit: