interface(quiet=true):

res:=proc(A,B,v) local n,m,R,L,bm:
    
    n:=degree(A,v):
    m:=degree(B,v):
    
    if (n=0) then
        return A^m:
    elif (m=0) then 
        return B^n:
    elif n<m then
        return (-1)^(m*n)*res(B,A,v):
    end if:
    
    R:=rem(A,B,v):
    L:=degree(R,v):
    bm:=coeff(B,v,m):
    
    return simplify((-1)^(n-L+m*n)*bm^(n-L)*res(B,R,v)):
    
end proc:

f1:=(2*x-1)*(x^2+1):
g1:=(x^2-2):

trace(res);
res(f1,g1,x);
resultant(f1,g1,x);

quit;

f2:=(x^2+1-x)*z+(x^4+2*x^2-x):
g2:=z^2+1:

res(f2,g2,z);
resultant(f2,g2,z);

f3:=2*y*x^3-x^2*y^2+(2*y+1)*8*x-3:
g3:=2*x^2-(3-y^2)*x+(2*y^2-5):

res(f3,g3,x);
resultant(f3,g3,x);

quit;
