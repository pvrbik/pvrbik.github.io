a:=expand( (x^4-3*x^3*y-x^2-y)*(8*x-4*y+12)*(2*y^2-2) ):

a:=collect(a,x);

coeff(a,x,5);

helpCont:=proc(a,var,n):
    
    if (n=0) then return coeff(a,var,0): end if:
    
    return gcd(coeff(a,var,n), helpCont(a,var,n-1)):
    
end proc:

cont:=(a,var)->helpCont(collect(a,var),var,degree(a,var)):

cx:=cont(a,x); ppx:=simplify(a/cx); 
cy:=cont(a,y); ppy:=simplify(a/cy); 

primpart(a,x,'c1'); c1;
primpart(a,y,'c2'); c2;
