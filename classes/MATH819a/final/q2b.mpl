####Question 2B###
####PAUL VRBIK###
####301056796 ###

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

a:=(y^2-y)*(x^2-y^2-1)*(x-y+2):
b:=2*y*(y*x^2+y^3+3*x*y-1)*(x-y+2):

a:=expand(a);
b:=expand(b);

gcd(a,b);
PEA(a,b);

quit;