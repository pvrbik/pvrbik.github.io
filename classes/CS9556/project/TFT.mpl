read "common.mpl":

h_myTFT::list(complex):=proc(xs::Array(complex),w::complex,p::nonnegint,l::nonnegint)
#intput     ::  xs[0..n-1]
#           ::  w - complex number such that w^(2^p) = 1
#output     ::  the FFT
local x,xp,s,indx,wn,n,ms,i,j,uBound;
global NumOps;
    
NumOps:=0;
    
    n:=2^p;
    
    x:=xs;  xp:=Array(0..n-1,datatype=complex);
    for s from 1 to p do
        ms:=2^(p-s);
        uBound:=( trunc( (l)/ms )+1 )*ms - 1;
        for i from 0 to n/ms-2 by 2 do
            wn:=w^(BinFlip(i,s)*ms);
            for j from 0 to ms-1 do
                indx:=i*ms+j;
                if indx > uBound then break; end if; 
                xp[indx]    :=evalc(x[indx]+wn*x[indx+ms]);
NumOps:=NumOps+1;
            end do;
            
            for j from 0 to ms-1 do
                indx:=i*ms+j;
                if indx > uBound then break; end if; 
                xp[indx+ms] :=evalc(x[indx]-wn*x[indx+ms]);
NumOps:=NumOps+1;
            end do;
        end do;
        (x,xp):=(xp,x); #this swaps pointers
    end do;
    
    return [ seq( evalc(simplify(x[i])), i=0..l-1) ];
end:

myTFT::list(complex):=proc(F,p::nonnegint)
local x,n,a;
    x:=indets(F)[1];
    n:=2^p;
    a:=Array(0..n-1, [ seq(coeff(F,x,i), i=0..degree(F)), 0$(n-degree(F))]);
    return h_myTFT(a, evalc(exp(2*I*Pi/n)), p, degree(F,x)+1 );
end proc: