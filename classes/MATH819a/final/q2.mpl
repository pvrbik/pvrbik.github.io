interface(quiet=true);

PEA:=proc(a,b) local c,d,r,gam,g:
    
#   primpart and content are equiv. commands
    c:=primpart(a,x):
    d:=primpart(b,x,'cd'):
    
    while d<>0 do 
        
        r:=prem(c,d,x):
        c:=d:
        d:=primpart(r,x):
        
    end do:
    
    gam:=gcd( content(a,x), content(b,x) ):
    gam:=gam*c;
    
     return gam;
    
end proc:

res:=proc(a,b) local n,m,c,d,r,gam,L,bm,adj,ans;
    
    n:=degree(a,x):
    m:=degree(b,x):
    
    if (n=0) then 
        return a^m;
    elif (m=0) then 
        return b^n;
    elif n<m then
        return (-1)^(m*n)*res(b,a);
    end if:
    
    c:=primpart(a,x,'ca'):
    d:=primpart(b,x,'cb');
    
    r:=prem(c,d,x,'M');
    
    if (r=0) then
        return 0;
    end if;
    
    
    L:=degree(r,x):
    bm:=coeff(d,x,m):
    
    adj:=M^m;
    ans:=ca^m*cb^n*(-1)^(n-L)*bm^(n-L)*res(r,d)/adj;
    
    return ans;
    
end proc:

#a:=48*x^3-84*x^2+42*x-36;
#b:=-4*x^3-10*x^2+44*x-30;

#a:=(y^2-y)*(x^2-y^2-1)*(x-y+2);
#b:=2*y*(y*x^2+y^3+3*x*y-1)*(x-y+2);

#a:=(2*x-1)*(x^2+1):
#b:=(x^2-2):

a:=85*x^5-55*x^4-37*x^3-35*x^2+97*x+50;
b:=79*x^5+56*x^4+49*x^3+63*x^2+57*x-59;

res(a,b);
resultant(a,b,x);
quit:
