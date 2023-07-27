GEOdiv:=proc(f,g,var)
local t,p,r,q,rtg, LTP, t1, t2:
    
    p:=MkGeoBuck(f):
    
    r:=Maple2Smp(0,var):
    q:=Maple2Smp(0,var):
    
    LTP:=getLT(p):
    
    t1:=new([],1):
    t2:=new([],1):
    
    while not(LTP=0) do
        
        if (myDiv([LTP],[LT(g)],'t')=false) then
            r:=SMPadd(r,[LTP]):
#           delete leading term of p (done by getLT)
        else
            
            q:=SMPadd(q,t):
#            calculate (-t)*rest(g)
            
            rtg:=SMPmult(SMPneg(t),g[2..-1],var):
            
            t1:=DynCopy(rtg,t1):
            
            p:=GeoAdd(p,t1,t2):
            
        end if:
        
        LTP:=getLT(p):
        
    end do:
    
    return (r,q):
    
end proc: