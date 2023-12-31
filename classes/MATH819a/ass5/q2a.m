#interface(quiet=true):

h_pad:=proc(L,n)
    
    if L=[] then
        return [];
    elif L[1]=1 or degree(L[1],x) mod n = 0 then
        return [L[1], op(h_pad(L[2..-1],n+1))]
    else
        return [1,op(h_pad(L,n+1))]:
    end if:
    
end proc:

pad:=L->h_pad(L,1):

CantZass:=proc(f,p) local t,n;
    
    t:=[DDF(f,p)]:
    t:=pad(t);
    n:=nops(t):
    return foldr((x,y)->x union y, {}, seq( SplitDD(t[i],i,p),i=1..n));
    
end proc:

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

DDF:=proc(inA,p) local a,i,w,g:
    
    a:=inA:
    i:=1:
    w:=x:
    g[0]:=1:
    
    while (i <= floor(degree(a,x)/2) ) do
    
        w:=Powmod(w,p,a,x) mod p:
        g[i]:=Gcd(a,w-x) mod p:
        if (a[i] <> 1 ) then
            Rem(a,g[i],x,'q') mod p: 
            a:=q:
            w:=Rem(w,a,x) mod p:
        end if:
        i:=i+1:
    end do:
    g[i]:=a:
    return seq(g[j],j=1..i):
    
end proc:

p:=11;

#Question 1
print("a1"):
a1:=x^4+8*x^2+6*x+8;
CantZass(a1,p);
Factor(a1) mod 11;

print("a2");
a2:=x^6+3*x^5-x^4+2*x^3-3*x+3;
CantZass(a2,p);
Factor(a2) mod 11;

print("a3");
a3:=x^8+x^7+x^6+2*x^4+5*x^3+2*x^2+8;
CantZass(a3,p);
Factor(a3) mod 11;

#Question 2
p:=10^20+129:

a:=3;
if ( a&^((p-1)/2) mod p = 1) then
    print("Cantor:",CantZass(x^2-a,p));
    print("Maple:",Factor(x^2-a) mod p);
else
    print("modular square root does not exist"):
end if:

a:=5;
if ( a&^((p-1)/2) mod p = 1) then
    print("Cantor:",CantZass(x^2-a,p));
    print("Maple:",Factor(x^2-a) mod p);
else
    print("modular square root does not exist"):
end if:

a:=7;
if ( a&^((p-1)/2) mod p = 1) then
    print("Cantor:",CantZass(x^2-a,p));
    print("Maple:",Factor(x^2-a) mod p);
else
    print("modular square root does not exist"):
end if:


quit: