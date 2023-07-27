interface(quiet=true):

logPart:=proc(f)
local a,b,bp,Rz,r,k,inegral,i,d,c,v,j,vj:
    
    
    a:=numer(f):
    b:=denom(f):
    bp:=diff(b,x):
    
    Rz:=primpart( resultant(a-z*bp,b,x),z):
#    Rz:=resultant(a-z*diff(b,x),b,x):
    
    r:=factors(Rz):
    r:=[seq( op([i,1],r[2]), i=1..nops(r[2]) )]:
    k:=nops(r):
    
    integral:=0:
    
    for i from 1 to k do
        d:=degree(r[i],z):
        
        if d=1 then 
            c:=solve(r[i]=0,z):
            v:=gcd(a-c*bp,b):
            v:=v/lcepff(v,z):
            integral:=integral+c*ln(v):
        else
            look:=gcd(a-bp,b);
            v:=gcd(a-alpha*bp,b):
            v:=v/lcoeff(v,x):
            
            if d=2 then
                c:=[solve(r[i]=0,z)]:
                
                for j from 1 to 2 do
                    vj:=eval(v,alpha=c[j]):
                    integral:=integral+c[j]*ln(vj):
                end do
                
            else
                for j from 1 to d do
                    vj:=eval(v,alpha=c[j]):
                    integral:=integral+c[j]*ln(vj):
                end do
            end if
            
        end if:
    
    end do:
    
    return integral:
    
end proc:

trace(logPart);
logPart( (x^4-3*x^2+6)/(x^6-5*x^4+5*x^2+4) );

quit: