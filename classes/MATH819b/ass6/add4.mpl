#######
#Add 4#
#######
with(Groebner):

#Part (i)

#Letting alpha = sqrt(2) + sqrt(3) + sqrt(5)
#We have z - alpha = 0 
#So z - t - s - w = 0 where t^2 = 2, s^2 = 3 and w^2 = 5.
#And we can use a lex GB to eliminate s,t,w from:

I:=[ z-t-s-w, t^2-2, s^2-3, w^2-5 ];
G:=Basis(I, plex(s,t,w,z) );
indets(G[1]);
mz:=G[1];

irreduc(mz);
#So mz is the minimal polynomail for alpha

#CHECK

alpha := sqrt(2) + sqrt(3) + sqrt(5);
expand(eval( mz, z=alpha ));


#Part (ii)

#Letting beta = 1+sqrt(2)+2^(1/4) 
#We have z - beta = 0
#So z - 1 - t - s = 0 where t^2 = 2 and s^4 = 2.
#And we can use a lex GB to eliminate s,t from

I:=[ z-1-t-s, t^2-2, s^4-2 ];
G:=Basis(I,plex(s,t,z) );
indets(G[1]);
m:=G[1];

irreduc(m);
#So the minimal polynomial divides m

factor(m);

#lets take the first one
mz:=op(factor(m))[1];

irreduc(mz);

beta := 1+sqrt(2)+2^(1/4);
expand(eval( mz, z=beta ));

#So it is indeed the minimal polynomail.

quit:
