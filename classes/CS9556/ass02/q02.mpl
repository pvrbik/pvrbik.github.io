interface(quiet=true):

fastRED:=proc(A,B,x)
local m,n,Bs,S,As,Qs,q,r;
    
    m,n:=degree(A,x),degree(B,x);
    
    if m<n then
        return A;
    end if;
    
    Bs:=add( coeff(B,x,i)*y^(n-i), i=0..n);
    As:=add( coeff(A,x,i)*y^(m-i), i=0..m);
    
    gcdex(Bs,y^(m-n+1),y,'S','t');
#   => s*Bs + t*y^(m-n+1) = 1 => S*Bs = 1 mod y^(m-n+1)
    
    Qs:=rem( expand(As*S), y^(m-n+1), y);
    
    q:=add( x^(m-n-i)*coeff(Qs,y,i), i=0..m-n );
    r:=expand(A-B*q);
    
    return (q,r);
end proc:

#f:=3+x-x^2+x^3;
#g:=x-1;

f:=expand( (x+1)*(x+2)*(x+3)+7 );
g:=x+1;

quo(f,g,x);
rem(f,g,x);

trace(fastRED);
fastRED(f,g,x);

quit;