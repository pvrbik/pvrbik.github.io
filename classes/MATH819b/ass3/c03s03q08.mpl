#Chapter 3 Section 3 Question 8

with(Groebner):

#(a)

F:=[x-(3*u+3*u*v^2-u^3), y-(3*v+3*u^2*v-v^3), z-(3*u^2-3*v^2)];

G:=Basis(F,plex(u,v,x,y,z));

map(indets,G);
#G[1] is the single element involving only x,y and z.
#It follows from Elimination Thm that V(G[1]) is the smallest variety contating the Enneper surface.

#(b)
#Notice that
G[9];
#is in K \intersect [v,z,y,z] = I_1 and has leading term 2*v^3 in k[x,y,z][v]
#it follows from Cor 4 in 3.1 that all complex solutions from I_2 extend to I_1.

G[-1];
#has leading term 3*u^2 in k[v,x,y,z][u]
#it follows from Cor 4 in 3.1 that all complex solutions from I_1 extend to I

#Therefore the equations in F parametrize the entire surface V(G[1]).

quit: