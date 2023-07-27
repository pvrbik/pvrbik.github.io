interface(quiet=true):
read "ModGcd.mpl":

mvModGcd:=proc(a,b,var,p) local phia,bound,i,abar,bbar,xpts,ypts:
    
    phia:=(f,alpha)->eval(f,var[2]=alpha):
    
    bound:=max(degree(a,var[1]), degree(b,var[1]) )+1:
#    bound:=p;
    
    ypts:=[]:
    
    for i from 1 to bound do
        abar:=phia(a,i):
        bbar:=phia(b,i):
        ca:=content(abar,var[1]):
        cb:=content(bbar,var[1]):
        c:=igcd(ca,cb);
        ypts:=[op(ypts),c*ModGcd(abar,bbar)]:
    end do:
    
    xpts:=[seq(i,i=1..bound)]:
    
    return Interp(xpts,ypts,var[2]) mod p:
    
end proc:

g:=t+1;

a:=g*(x+6)*x*(t+5);
b:=g*(x)*(t+1);

trace(mvModGcd):

factor(mvModGcd(a,b,[x,t],13));
factor(Gcd(a,b) mod 13);

quit;
