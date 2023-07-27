plotIt:=proc(N)
local p,f,pts,i,a,b,u0,st,t, f1, p1 ,p2:
    `mod`:=mods:
    p:=9973;
    f:=n->add(p^i,i=0..n-1):
    pts:=[]:
    
    for i from 1 to N do
        a:=f(i)^2;
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
