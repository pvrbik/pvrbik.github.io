#Chapter 2 Section 7 Question 2
#interface(quiet=true):

with(Groebner):

#LEX ORDER
#(c)

S:=(i,j,G)->SPolynomial(G[i],G[j],plex(x,y,z)):
div:=(f,G)->NormalForm(f,G,plex(x,y,z)):

G:=[x-z^4,y-z^5]:
S(1,2,G); div(%,G);

#So we get lucky and the GB is just G.

#GRADED LEX ORDER
#(C)

read "BBA.mpl":

G:=[x-z^4,y-z^5]:
BBA(G,grlex(x,y,z));

quit;
