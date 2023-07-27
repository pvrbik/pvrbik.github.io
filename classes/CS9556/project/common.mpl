BinFlip::integer:=proc(m::integer,p::integer)
local xs,nxs,ans,i;
    
    xs:=convert(m,base,2); #L[-1] is highest bit
    nxs:=nops(xs);
    ans:=0;
    
    for i from 1 to nxs do
        ans:=ans+2^(p-i)*xs[i];
    end do;
    
    BinFlip(m,p):=ans;
    return ans;
end proc:

check1:=proc(F,p)
local n,w;
    n:=2^p;
    w:=exp(2*I*Pi/n);
    return [seq( expand(eval(F,x=w^i)), i=0..n-1 )];
end proc:

check2:=proc(F,p)
local n,w,l;
    n:=2^p;  l:=degree(F)+1;
    w:=exp(2*I*Pi/n);
    return [seq( evalc(eval(F,x=w^(BinFlip(i,p)))), i=0..l-1 )];
end proc: