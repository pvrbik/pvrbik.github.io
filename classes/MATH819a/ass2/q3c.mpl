helpCont:=proc(a,var,n):
    
    if (n=0) then return coeff(a,var[1],0): end if:
    
    return PEA(coeff(a,var[1],n), helpCont(a,var,n-1),var[2..nops(var)]):
    
end proc:

cont:=(a,var)->helpCont(collect(a,var[1]),var,degree(a,var[1])):

PEA:=proc(inA,inB,var) local c,rm,rc,rp,x1,x2,temp:
    
    if (inA=0) then 
        return inB:
    elif (inB=0) then 
        return inA:
    end if:
    
#   case: UFD is just Z
    if (nops(var)=0) then return igcd(inA,inB): end if:
    
    x1:=cont(inA,var):
    x2:=cont(inB,var):
    
    c:=PEA(x1,x2,var[2..nops(var)]):
    
    divide(inA,x1,'rm'):
    divide(inB,x2,'rc'):
    
    while (rc<>0)  do
    
        rp:=(prem(rm,rc,var[1])):
        
        if (rp=0) then 
            rp:=0:
        else
            divide(rp,cont(rp,var),'rp'):
        end if:
        
        rm:=rc:
        rc:=rp:
    end do:
    
    return c*rm;
    
end proc:

a:=expand( (x^4-3*x^3*y-x^2-y)*(2*x-y+3)*(8*y^2-8) ):
b:=expand( (x^3*y^2+x^3+x^2+3*x+y)*(2*x-y+3)*(12*y^3-12) ):

expand(PEA(a,b,[x,y]));

