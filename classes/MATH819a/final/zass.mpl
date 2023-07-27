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
        if (g[i] <> 1 ) then
            Rem(a,g[i],x,'q') mod p: 
            a:=q:
            w:=Rem(w,a,x) mod p:
        end if:
        i:=i+1:
    end do:
    g[i]:=a:
    return seq(g[j],j=1..i):
    
end proc: