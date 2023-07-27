#interface(quiet=true):

r:=(ma,mb)->resultant(ma,resultant(mb,z-x-y,y),x):
check:=(f,x)->expand(eval(f,z=x)):

#Part a)
c:=1+sqrt(2):

ma:=x-1:
mb:=y^2-2:

mc:=sort(r(ma,mb));
check(mc,c);
irreduc(mc);

#Part b)
c:=1+2^(1/2)+2^(1/4):

ma:=eval(mc,z=x):
mb:=y^4-2:

mc:=sort(r(ma,mb));
check(mc,c);

mc1,mc2:=op(factor(mc));
check(mc1,c); #non-zero so mc2 must be the minimal poly.
check(mc2,c);

mc:=mc2:
irreduc(mc);

#Part c)
c:=sqrt(2)+sqrt(3)+sqrt(5):

#We have that the minimal polynomial for sqrt(2)+sqrt(3) is
ma:=x^4-10*x^2+1:
mb:=y^2-5:


mc:=r(ma,mb);
check(mc,c);
irreduc(mc);

quit:
