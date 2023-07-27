#interface(quiet=true):

ZQRST:=proc(a,u0,p) local u,pk,k,e,uk,i:
    `mod`:=mods:
    u:=mods(u0,p):
    i:=modp (1/(2*u0),p):
    pk:=p:
    e:=a-u0^2:
    e:=e/p:
    
    for k do
        if e = 0 then
            return u:
        elif (e<0) then
            return "FAIL":
        end if:
        
        uk:=mods( e*i, p):
        
        e:=(e-2*u*uk-uk^2*pk)/p:
        
        u:=u+uk*pk:
        pk:=p*pk:
    end do:
    
end proc:

`mod`:=mos:
p:=9973;
a:=nextprime(p)^2;
Factor(x^2-a) mod p;
ZQRST(a,34,p);
ZQRST(a,-34,p);
nextprime(p);

quit;

plotIt:=proc(N)
local p,f,pts,i,a,b,u0,st,t, f1, p1 ,p2,p3:
    `mod`:=mods:
    p:=9973;
    f:=n->add(p^i,i=0..n-1):
    pts:=[]:
    
    for i from 1 to N do
        a:=f(i)^2;
        convert(a,base,p);
        b:=Factor(x^2-a) mod p;
        u0:=op([1,2],b);
        st:=time():
            ZQRST(a,u0,p);
        t:=time()-st:
        
        pts:=[op(pts),[2*i,t]]:
    end do:
    
    plotsetup(x11):
    with(plots):
    f1:=CurveFitting[LeastSquares](pts,x,curve=A*x^2+B*x+C);
    p1:=pointplot(pts);
    p2:=plot(f1,x=0..pts[nops(pts)][1],title="timing",labels=["n","time"]);
    
    plots[display]({p1,p2});
end proc:
