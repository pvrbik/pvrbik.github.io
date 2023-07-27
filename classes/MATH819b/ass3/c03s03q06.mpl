#Chapter 3 Section 3 Question 6

with(Groebner):

#(a)

S:=[x-u*v,y-u^2,z-v^2];
G:=Basis(S,plex(u,v,x,y,z) );
map(indets,G);
G[1];
#It follows by Ext. Thm that V(x^2-y*z) is the "smallest" variety containing S.

#(b)
#I_2 is the first elimnation ideal of I_1=<G[1],G[2]> where:
G[1]; G[2];
#But notice that G[2] has leading term 1*v^2 in K[x,y,z][v]
#By Cor 4 in 3.1 (where c=1) it follows that all complex soultions from I_2 extend to I_1

#Also notice that
G[6];
#Has leading term u^2 in K[v,x,y,z][u].
#And again, by Cor 4 in 3.1 (wher c=1) we have that the complex solutions from I_1 extend to I

#This means that V=S as desire.

#(c)

#Now we must ensure that the solutions we're extending are in the reals.
#But consider that 
solve(G[2],[v]);
solve(G[6],[u]);
#which only have real soltuions if z>=0 and y>=0 respectively.

#But if z>=0 and y>=0 we only caputre "half" of V (see maple plot next page).

#To capute the other half we let S de defined by: (x,y,z)=(u*v,-u^2,-v^2);
#and we check this
S:=[x-u*v,y+u^2, z+v^2];
G:=Basis(S,plex(u,v,x,y,z));

#As you see we have:
#x^2=y*z which will be real when sign(y)=sign(z)
#v^2=-z which will be real for z<0
#u^2=-y which will be real for y<0

#We see that this captures the other "half" of the parat (refer to plot).

quit:
