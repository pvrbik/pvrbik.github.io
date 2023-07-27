read "mqrr.mpl":
with(LinearAlgebra):

pad:=padicLinearSolve:

padicLinearSolve:=proc(A,b)
local p,d,Ainv,k,ek,xk,x,y,pk,T,dim,i,u:
    
    p:=prevprime(2^16): 
    
    dim:=Dimension(b):
    Ainv:=Inverse(A) mod p:
    
    ek:=b:
    xk:=ZeroVector[column](dim):
    x:=ZeroVector[column](dim):
    y:=Vector[column](dim):
    
    k:=0: pk:=1:
    while (true) do
        xk:=Ainv.(ek mod p) mod p:
        x:=x+xk*pk:
        
        ek:=(ek-A.xk)/p;
        
        if k=2^ilog2(k) then
            
            T:=1000*ilog2(pk);
            i:=0:
            
            for u in x do
                i:=i+1:
                y[i]:=MQRR(u,pk,T):
                if y[i]=FAIL then 
                    break:
                end if:
            end do:
            
            if  i=dim then
                d:=lcm(seq(denom(x), x in y)):
                
                if convert(b*d-A.y*d,set)={0} then
                    print("k=",k);
                    return y:
                end if:
            end if:
                
        end if:
        k:=k+1: pk:=pk*p:
    end do:
    
end proc:
