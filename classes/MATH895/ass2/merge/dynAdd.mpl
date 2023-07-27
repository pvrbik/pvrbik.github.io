Extend:=proc(A):
    A[0][2]:=ceil(1.5*A[0][2]):
    return Array(0..A[0][2], A):
end proc:

dynSMPadd:=proc(p,rtg,INpPr)
local L,J,K,pPr, curSize, totSize, i:
#rtg::LIST = rest of t times g (already negated)
#   #   #   #   #
global N:
#   #   #   #   #
    
    pPr:=INpPr:
    
    curSize:=L->L[0][1]:
    totSize:=L->L[0][2]:
    
#   L,J,K defined as in the notes.
    L,J,K:=(p[0][3]+1),1,1;
    
    pPr[0][1]:=0:
    pPr[0][3]:=1:
    
    while (J<=nops(rtg)) and (L<=curSize(p)) do
        
        if (K>totSize(pPr)) then
            pPr:=Extend(pPr):
        end if:
    
#   #   #   #   #   #   #   #   #
        N:=N+1:
#   #   #   #   #   #   #   #   #
        
        if (evalb(p[L][2]=rtg[J][2])) then
            pPr[K]:=[p[L][1]+rtg[J][1],p[L][2]]:
            J,L:=(J+1),(L+1):
            K:=K+1:
        elif (gt(p[L][2],rtg[J][2])) then
            pPr[K]:=p[L]:
            L:=L+1:
            K:=K+1:
        else
            pPr[K]:=rtg[J]:
            J:=J+1:
            K:=K+1:
        end:
        
    end do:
    
    while (J<=nops(rtg)) do
        if (K>totSize(pPr)) then
            pPr:=Extend(pPr):
        end if:
        pPr[K]:=rtg[J]:
        J,K:=(J+1),(K+1):
    end do:
    
    while (L<=curSize(p)) do
        if (K>totSize(pPr)) then
            pPr:=Extend(pPr):
        end if:
        pPr[K]:=p[L]:
        L,K:=(L+1),(K+1):
    end do:
    
    pPr[0][1]:=K-1:
    p[0][1]:=0:
    p[0][3]:=1:
    
    return (pPr,p):
    
end proc:
