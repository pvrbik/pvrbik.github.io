#interface(quiet=true);
#Extended Euclidean Algorithm

EEA:=proc(a,b,x) local n,u,c,d,c1,c2,d1,d2,r1,r2,r,q,g,s,t:

    n:=f->f/lcoeff(f,x):
    u:=f->lcoeff(f,x):
    
    c,d:=n(a),n(b):
    
    c1:=1:  c2:=0:  d1:=0:  d2:=1:
    
    while (d<>0) do
        q:=quo(c,d,x): r:=expand(c-q*d):
        r1:=expand(c1-q*d1): r2:=expand(c2-q*d2):
        c:=d: c1:=d1: c2:=d2:
        d:=r: d1:=r1: d2:=r2:
    end do:
    
    g:=n(c):
    s:=c1/(u(a)*u(c)): 
    t:=c2/(u(b)*u(c)):
    
    return g,s,t:
    
end proc:

A0:=3+x-x^2+x^3;
A1:=1-x+x^2;

r:=gcdex(A0,A1,x,'s','t'):
r,s,t;
expand(s*A0+t*A1) = r;

r,s,t:=EEA(A0,A1,x):
r,s,t;
expand(s*A0+t*A1) = r;

quit: