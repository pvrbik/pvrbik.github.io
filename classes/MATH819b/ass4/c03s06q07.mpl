#3.6 Question 7
#Let I=<f,g> where
f:=u*(1+t^2)-t^2;
g:=v*(1+t^2)-t^3;

#We use the appropriate resultant to eliminate t.
h:=resultant(f,g,t);

#So the first elimination ideal I_1 = I \int R[u,v] = <h> (by Prop 1 (i))

#Any by Excersice 13 of 3.3 we can "clear the denominators" so h is the solution to the implicitization problem. 

#Let us check
simplify(eval(h,[u=t^2/(1+t^2),v=t^3/(1+t^2)]));

quit:
