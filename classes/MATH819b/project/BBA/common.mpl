Division:=proc(inF::polynom,gs,LT::procedure)
local g,f,i,qs,r,LTf,LTg:
    
    f:=inF:
    
    if gs={0} then error "division by zero": end if:
    
    for i from 1 to nops(gs) do
        qs[i]:=0:
    end do:
    
    r:=0:
    
    while f <> 0 do
        LTf:=LT(f):
        LTg:=gs[1][1]:
        
        for i from 1 while not divide(LTf, LTg, 'q') to nops(gs) do
            
            if i+1>nops(gs) then 
                r:=r+LTf:
                f:=expand(f-LTf):
                i:=0:
                break:
             end if:
            
            LTg:=gs[i+1][1]:
        end do:
        
        if i=0 then next: end if:
        
        qs[i]:=qs[i]+q:
        f:=expand(f-q*gs[i][2]):
        
    end do:
    
    return r:
    
end proc:
