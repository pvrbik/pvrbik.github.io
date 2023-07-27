karatsuba:=proc(f,g)
local df,dg,n,x,m,F0,G0,F1,G1,b,c,a;
    
printf("Call karatsuba( %a , %a )\n",f,g);
    
    if nops(indets(f))+nops(indets(g)) > 2 then error "univariates only"; end if;
    
    df,dg:=degree(f),degree(g);
    
    n:=max(df,dg);
    
    if n<1 then
        return f*g;
    end if;
    
    n:=2^(trunc(log[2](n))+1);
    
    x:=indets(f) union indets(g); #assuming = indet(g)
    x:=x[1];
    m:=n/2;
    
    F0:=rem(f,x^m,x,'F1');
    G0:=rem(g,x^m,x,'G1');
    
    a:=procname(F0,G0);
    b:=procname(F1,G1);
    c:=procname(F0+F1,G0+G1);
    
    return b*x^n+(c-a-b)*x^m+a;
end proc:

interface(quiet=false);
f:=1-2*x^3+3*x^3;
g:=1-x-2*x^2-x^3;

h:=karatsuba(f,g);
expand(h - f*g);

quit: