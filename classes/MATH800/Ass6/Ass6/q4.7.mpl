eps:=(M,Q)-> evalf(1-foldr((x,y)->(x*y),1, seq((1-i/M), i=1..(Q-1))));

estEps:=(M,Q)->1-evalf(exp(-Q*(Q-1)/2/M));

M:=365;

#The following sequence defines the list [est,EstEps,est-EstEps]

seq([eps(M,i),estEps(M,i),eps(M,i)-estEps(M,i)],i=15..30);

quit;
