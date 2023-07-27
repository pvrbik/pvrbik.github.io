##############
#Question 4 A#
##############

with(Groebner):

#Letting alpha = sqrt(2) + sqrt(3) + sqrt(6)
#We have z - alpha = 0 
#So z - t - s - st = 0 where t^2 = 2, s^2 = 3
#And we can use a lex GB to eliminate s,t from:

I:=[ z-t-s-s*t, t^2-2, s^2-3 ];
G:=Basis(I, plex(s,t,z) );
map(indets,G);
mz:=G[1];

irreduc(mz);

alpha := sqrt(2) + sqrt(3) + sqrt(6);

Z:=eval( mz , z=alpha ):
simplify( Z );

