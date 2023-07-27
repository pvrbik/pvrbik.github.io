EEA:=proc(a,b) local n,u,c,d,c1,c2,d1,d2,r1,r2,r,q,g,s,t:

    n:=f->f/lcoeff(f,x):
    u:=f->lcoeff(f,x):
    
    c:=n(a):
    d:=n(b):
    
    c1:=1:
    c2:=0:
    d1:=0:
    d2:=1:
    
    while (d<>0) do
        q:=quo(c,d,x): r:=expand(c-q*d):
        r1:=expand(c1-q*d1): r2:=expand(c2-q*d2):
        c:=d: c1:=d1: c2:=d2:
        d:=r: d1:=r1: d2:=r2:
    end do:
    
    g:=n(c):
    s:=c1/(u(a)*u(c)): 
    t:=c2/(u(b)*u(c)):
    
    return (s,t,g):
    
end proc:

a:=randpoly(x,dense,degree=5):
b:=randpoly(x,dense,degree=4):

(s1,t1,g1):=EEA(a,b):

evalb(expand(s1*a+t1*b) = g1);

g2:=gcdex(a,b,x,'s2','t2'):

(s1,t1,g1);
(s2,t2,g2);

