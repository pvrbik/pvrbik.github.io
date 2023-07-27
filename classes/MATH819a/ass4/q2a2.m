interface(quiet=true):

cubeRoot:=proc(F,p,u0,bound)

    dF:=eval(diff(F,u),u=u0):
    
    ubar:=u0:
    
    while (true) do
        
        ubark:=((F(ubar)/p^k) mod p)/dF:
        ubar:=ubar+ubark*p^k:
        
        if (F(ubar)=0) then 
            return ubar:
        elif (p^k>bound) then
            return  FALSE:
        end if:
        
        k:=k+1:
        
    end do

end proc:

quit;
