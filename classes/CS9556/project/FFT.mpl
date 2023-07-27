read "common.mpl":

h_myFFT::list(complex):=proc(xs::Array(complex),w::complex,p::nonnegint)
#intput     ::  xs[0..n-1]
#           ::  w - complex number such that w^(2^p) = 1
#output     ::  the FFT
local x,xp,s,indx,wn,n,ms,i,j;
global NumOps, SaveA;
    
NumOps:=0;
    
    n:=ArrayNumElems(xs); #:=2^p
    if n <> 2^p then error "something wrong"; end if;
    
    x:=Array(0..n-1,datatype=complex); xp:=Array(0..n-1,datatype=complex);
    x:=xs;
    
SaveA[0]:=convert(x,list);
    
    for s from 1 to p do
        ms:=2^(p-s);
        for i from 0 to n/ms-2 by 2 do
            wn:=w^(BinFlip(i,s)*ms);
            for j from 0 to ms-1 do
                indx:=i*ms+j;
                xp[indx]    :=evalc(x[indx]+wn*x[indx+ms]);
                xp[indx+ms] :=evalc(x[indx]-wn*x[indx+ms]);
NumOps:=NumOps+2;
            end do;
        end do;
SaveA[s]:=convert(xp,list);
        (x,xp):=(xp,x); #this swaps pointers
    end do;
    
    for i from 0 to n-1 do
        xp[i]:=evalc( simplify( x[ BinFlip(i,p) ] ) );
    end do;
    
    return convert(xp,list);
end:

myFFT::list(complex):=proc(F,p::nonnegint)
local x,n,a;
    x:=indets(F)[1];
    n:=2^p;
    a:=Array(0..n-1, [ seq(coeff(F,x,i), i=0..degree(F)), 0$(n-degree(F))]);
    return h_myFFT(a, evalc(exp(2*I*Pi/n)) ,p);
end proc:

invFFT:=proc(xs::list(complex),p::nonnegint)
local n,w,as;
    
    n:=2^p;
    w:=exp(2*I*Pi/n);
    
    as:=h_myFFT( Array(0..n-1, xs),evalc(1/w), p);
    
    add( 1/n*as[i+1]*x^i, i=0..n-1 );
end proc: