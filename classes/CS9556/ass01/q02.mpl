interface(quiet=true):

unprotect(FFT);

FFT:=proc(f,n)
local w;
    w:=exp(2*I*Pi/n);
    return h_FFT(f,n,w,indets(f)[1]);
end proc;

h_FFT:=proc(f,n,w,x) #naive implemenation
local df,Feven,Fodd,V,Vp;
printf("Call FFT( %a , %a ) with w=%a\n",f,n,w);
    
    if n=1 then return [f]; end if;
    
    df:=degree(f,x);
    Feven:=add( x^i*coeff(f,x,2*i),i=0..trunc(df/2));
    Fodd:=add( x^i*coeff(f,x,2*i+1),i=0..trunc(df/2));
    
    V:=procname(Feven,n/2,w^2,x);
    Vp:=procname(Fodd,n/2,w^2,x);
    
#   return [f(w^0),...,f(w^(n-1))];
    return [seq( V[i mod n/2 + 1] + w^i*Vp[i mod n/2 + 1], i=0..n-1 )];
end proc:

InvFFT:=proc(A,n)
local w,f,B;
    w:=exp(2*I*Pi/n);
    
    f:=add( A[i+1]*x^(i), i=0..nops(A)-1 );
    
    B:=FFT(f,n,1/w,x);
    B:=B/n;
    
    return evalc(add( B[i+1]*x^i, i=0..nops(B)-1 ));
    
end proc:

interface(quiet=false):
P:=1-x-2*x^2-3*x^3;
n:=4:

A:=FFT(P,n);

#check
w:=exp(2*I*Pi/n):
B:=[ seq( eval(P,x=w^i), i=0..n-1) ]:
map( evalc, A-B );

#trace(InvFFT);
InvFFT(B,n);

quit: