#3.6 Question 1

f:=x^2*y-3*x*y^2+x^2-3*x*y;
g:=x^3*y+x^3-4*y^2-3*y+1;

#(A)
resultant(f,g,x);

#(B)
resultant(f,g,y);

#(C)
#The result from part (B) implies that f and g have a common factor in k[y,x] with positive degree in y (by proppositon 1 part ii).
#Let us check this:

gcd(f,g);

quit: