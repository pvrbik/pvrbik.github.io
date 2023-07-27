####Question 2C###
####PAUL VRBIK###
####301056796 ###

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

a:=85*x^5-55*x^4-37*x^3-35*x^2+97*x+50;
b:=79*x^5+56*x^4+49*x^3+63*x^2+57*x-59;

res(a,b);
resultant(a,b,x);
quit:
