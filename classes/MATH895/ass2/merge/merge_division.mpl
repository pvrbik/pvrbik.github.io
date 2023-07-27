read "../SDMP.mpl":
read "dynAdd.mpl":

last:=x->[op(ArrayDims(x))][2]:

SMPdiv:=proc(f,g,var)
local r,p,pPr,q,t,rtg,rstG:
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
    rstG:=g[2..-1]:
    
    while not(SMPzero(p)) do
#   #   #   #   #   #   #   #   #   #
            M:=M+1:
#   #   #   #   #   #   #   #   #   #
        
        if (myDiv([LT(p)],[LT(g)],'t')=false) then
            r:=[r,LT(p)]:
#           delete leading term of p
            p[0][3]:=p[0][3]+1:
        else
            q:=[q,op(t)]:
#           calculate (-t)*rest(g)
            rtg:=[seq([-x[1]*t[1][1],x[2]+t[1][2]],x in rstG)]:
            
#   #   #   #   #   #   #   #   #   #
            M:=M+nops(g)-1:
#   #   #   #   #   #   #   #   #   #
            (p,pPr):=dynSMPadd(p,rtg,pPr):
        end if:
        
    end do:
    
    interface(quiet=false):
    return (flatten(q),flatten(r)):
    
end proc: