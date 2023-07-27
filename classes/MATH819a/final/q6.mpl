####Question 3###
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

f:=12*x^6-12*x^5-26*x^4+15*x^3-6*x^2+27*x-28;
a:=f;

###p=11###
p:=11;

Factor(a) mod p;

w:=x;
w:=Powmod(w,p,a,x) mod p;
g[1]:=Gcd(w-x,a) mod p;
a:=Quo(a,g[1],x,'rr') mod  p; 

w:=Powmod(w,p,a,x) mod p;
g[2]:=Gcd(w-x,a) mod p;
a:=Quo(a,g[2],x,'rr') mod  p; 

d1:=SplitDD(g[1],1,p);
d2:=SplitDD(g[2],2,p);

#Factorization is:
d1 union d2;

###p=13###
a:=f;

p:=13;

Factor(a) mod p;

w:=x;
w:=Powmod(w,p,a,x) mod p;
g[1]:=Gcd(w-x,a) mod p;
a:=Quo(a,g[1],x,'rr') mod  p; 

w:=Powmod(w,p,a,x) mod p;
g[2]:=Gcd(w-x,a) mod p;
a:=Quo(a,g[2],x,'rr') mod  p; 

w:=Powmod(w,p,a,x) mod p;
g[3]:=Gcd(w-x,a) mod p;
a:=Quo(a,g[3],x,'rr') mod  p; 

#Since these are alread the appropriate degrees the factorization is given by
{a,g[1],g[2],g[3]};

###HENSEL LIFTING###
read "hensel.mpl";
Expand(f - a*g[3]*g[2]*g[1]) mod p;
Gcd(g[3]*g[2],g[1]) mod p;
UHLA(f,p,g[3],g[2]*g[1],a);

quit;
