####Question 5A###
####PAUL VRBIK###
####301056796 ###

SplitDD:=proc(inA,n,p) local m,a,myFactors,v,g:
    
    a:=inA:
    
    if (degree(a,x)<=n) then
        return {a}:
    end if:
    
    m:=degree(a,x)/n:
    myFactors:={a}:
    
    while nops(myFactors)<m do
        v:=Randpoly(2*n-1,x) mod p:
        
        g:=Gcd(Powmod(v,(p-1)/2,a,x) mod p -1,a) mod p:
        
        if (g<>1) and (g<>a) then
            Rem(a,g,x,'q') mod p:
            myFactors:=SplitDD(g,n,p) union SplitDD(q,n,p):
        end if:
        
    end do:
    
    return myFactors:
    
end proc:


f:=x^5-246*x^4+321*x^2-39452*x+15129*x^3-3813;
a:=f;

###p=11###
p:=11;

Factor(a) mod p;

#the product of the linear factors is g[1]:
w:=x;
w:=Powmod(w,p,a,x) mod p;
g[1]:=Gcd(w-x,a) mod p;
a:=Quo(a,g[1],x,'rr') mod  p; 

SplitDD(g[1],1,p);

#Therefore the linear roots are -4=7 mod 11 and -9=2 mod 11.

quit;