myGcd:=proc(a,b,p) local ca,cb,cg:
    ca:=content(a,t,'ppa'):
    cb:=content(b,t,'ppb'):
    cg:=Gcd(ca,cb) mod p:
    return cg*(Gcd(ppa,ppb) mod p):
end proc:

fgcd:=proc(inF1,inF2,p,q) local g, f1, f2:
    f1:=inF1 mod q:
    f2:=inF2 mod q:
    g:=subs(RootOf(p)=t, simplify(myGcd(subs(t=RootOf(p),f1),subs(t=RootOf(p),f2),q))):
    return Expand(g) mod q:
end proc:

fcontent:=proc(f,v,p,q)
    return h_fcontent([coeffs(f,v)],p,q):
end proc:

h_fcontent:=proc(A,p,q):
    if type(A[1],integer) then
        return h_fcontent( [A[1]+p mod q,op(A[2..-1])],p,q)
    elif nops(A)=1 then
        return A[1]:
    else
        return Gcd(A[1], h_fcontent(A[2..-1],p,q) ) mod q:
    end if:
end proc:

monic:=proc(f,p,q) local lc:
    
    lc:=lcoeff(f,x):
    Gcdex(lc,p,t,'invLc') mod q:
    return Expand (f*invLc) mod q:
    
end proc:

q:=3:
p:=Nextprime(t^2,t) mod q: p:=Nextprime(p,t) mod q;
Phi:=x->Rem(x,p,t) mod q: