#interface(quiet=true):

RED:=proc(A,B,x)
local m,n,Ap;
    
    printf("Call RED(%a,%a,x)\n",A,B);
    m,n:=degree(A,x),degree(B,x);
    if m<n then
        return A;
    else
        Ap:=expand(A - coeff(A,x,m)*x^(m-n)*B);
        return RED(Ap,B,x);
    end if;
    
end proc;

f:=3+x-x^2+x^3:
g:=x-1:

rem(f,g,x);
RED(f,g,x);

quit;