#SECTION 2.6
#QUESTION 9

#interface(quiet=true):
read "add2common.mpl":
with(Groebner):

S:=proc(f,g,ord)
local x,LM,LT:
    
    LM:=f->LeadingMonomial(f,ord):
    LT:=f->`*`(LeadingTerm(f,ord)):
    
    x:=lcm(LM(f), LM(g)):
   
    return expand(x/LT(f)*f - x/LT(g)*g):
    
end proc:

#Section 2.6
#Qustion 9

#(a)
G:=[x^2-y,x^3-z];
ord:=grlex(x,y):

Spoly:=S(G[1],G[2],ord);

NormalForm( Spoly, G, ord);
#The non-zero remainder implies that this is NOT a GB for I.

#(b)
G:=[x^2-y,x^3-z];
ord:=plex(x,y):

Spoly:=S(G[1],G[2],ord);
NormalForm(Spoly,G,ord);
#The non-zero remainder implies that this is NOT a GB for I.

#(c)
G:=[x*y^2-x*z+y, x*y-z^2, x-y*z^4];
Gpairs:=combinat[choose](G,2);
ord:=plex(x,y,z):
Ss:=map(Gp->S(Gp[1],Gp[2],ord),Gpairs);
map(NormalForm,Ss,G,ord);
#The non-zero remainders implies that this is NOT a GB for I.

quit: