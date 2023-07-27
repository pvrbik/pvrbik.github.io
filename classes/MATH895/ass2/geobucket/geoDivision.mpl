read "../SDMP.mpl":
read "geoCommon.mpl":

DynCopy:=proc(A,inB)
#copies A::list into B::queueu
local B,i:
    
    B:=inB:
    clear(B):
    for i from 1 to nops(A) do
        
        if (i>last(B)) then
            B:=Array(0..2*last(B),B):
        end if:
        
        enqueue(B,A[i]):
        
    end do:
    return B:
end proc:

GEOdiv:=proc(f,g,var)
local t,p,r,q,rtg, LTP, t1, t2:
global M:
    
    interface(quiet=true):
    if (f[1][1]=0) then return 0 end if:
    
    p:=MkGeoBuck(f):
    
    r:=[];
    q:=[];
    
    LTP:=getLT(p):
    
    t1:=new([],1):
    t2:=new([],1):
    
    while not(LTP=0) do
        
        if (myDiv([LTP],[LT(g)],'t')=false) then
            r:=[op(r),LTP]:
#           delete leading term of p (done by getLT)
        else
            
            q:=[op(q),op(t)]:
#            calculate (-t)*rest(g)
            
            rtg:=SMPmult(SMPneg(t),g[2..-1],var):
            
            t1:=DynCopy(rtg,t1):
            
            p:=GeoAdd(p,t1,t2):
            
        end if:
        
        LTP:=getLT(p):
        
    end do:
    interface(quiet=false):
    return (q,r):
    
end proc: