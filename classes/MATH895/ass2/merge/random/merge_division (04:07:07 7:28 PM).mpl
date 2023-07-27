read "../SDMP.mpl":
read "dynAdd.mpl":

last:=x->[op(ArrayDims(x))][2]:

SMPdiv:=proc(f,g,var)
local r,p,pPr,q,t,rtg:
global M:
    
#   #   #   #   #   #   #   #   #   #
    M:=0:
#   #   #   #   #   #   #   #   #   #
    
    interface(quiet=true):
    if (f[1][1]=0) then return 0 end if:
    
    p:=Array(0..nops(f),[[nops(f),nops(f),1],op(f)]):
    pPr:=Array(0..nops(f),[[0,nops(f),1]]):
#   p[0]=[Current length, Total length, Head]
    
    r:=[]:
    q:=[]:
    
    while not(SMPzero(p)) do
        
#   #   #   #   #   #   #   #   #   #
            M:=M+1:
#   #   #   #   #   #   #   #   #   #
        
        if (myDiv([LT(p)],[LT(g)],'t')=false) then
            r:=[op(r),LT(p)]:
#           delete leading term of p
            p[0][3]:=p[0][3]+1:
        else
            q:=[op(q),op(t)]:
#           calculate (-t)*rest(g)
            rtg:=SMPmult(SMPneg(t),g[2..-1],var):
            
#   #   #   #   #   #   #   #   #   #
            M:=M+nops(g)-1:
#   #   #   #   #   #   #   #   #   #
            
            (p,pPr):=dynSMPadd(p,rtg,pPr):
        end if:
        
    end do:
    interface(quiet=false):
    return (q,r):
    
end proc: