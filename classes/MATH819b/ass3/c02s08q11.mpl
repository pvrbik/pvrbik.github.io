#Chapter 2 Section 8 Question 11
#interface(quiet=true):

with(Groebner):

#(a)

g1:=a+b+c-3;
g2:=a^2+b^2+c^2-5;
g3:=a^3+b^3+c^3-7;
G:=Basis([g1,g2,g3], grlex(a,b,c) );

g4:=a^4+b^4+c^4-9;

NormalForm(g4,G,grlex(a,b,c));
#The remainder implies that g4 \in G = <g1,g2,g3>
#This means there is some linear combination g4 = s1*g1 + s2*g2 + s2*g3
#But since a,b,c satisfy a+b+c-3 = 0 = g1 (similiarily g2=0 and g3=0)
#it follows that g4 = 0 at this a,b,c.
#The conclusion is that a^4+b^4+c^4 = 9 as desired.

#(b)

G:=Basis([g1,g2,g3], grlex(a,b,c) );
g5:=a^5+b^5+c^5-11;

NormalForm(g5,G,grlex(a,b,c));
#The non zero remainder means that g5 is not in the ideal <g1,g2,g3> and
#therefore does not satisfy g5=0 as g4 did above. This means that
#a^5+b^5+c^5 <> 11;

#(c)
g6:=a^5+b^5+c^5;
NormalForm(g6,G,grlex(a,b,c));
#So the true value of a^5+b^5+c^5 is 29/3.

g7:=a^6+b^6+c^6;
NormalForm(g7,G,grlex(a,b,c));
#So the true value of a^6+b^6+c^6 is 19/3.

#NOTES for (c)
#If gi = s1*g1 + s2+g2 + s3*g3 + r then
# gi + r \in <g1,g2,g3>

quit;
