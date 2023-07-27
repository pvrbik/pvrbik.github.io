interface(quiet=true):
read "SDMP.mpl":
!clear

Extend:=proc(A):
    A[0][2]:=ceil(1.5*A[0][2]):
    return Array(0..A[0][2], A):
end proc:

dynSMPadd:=proc(p,rtg,INpPr)
local L,J,K, curSize, totSize, i:
#rtg::LIST = rest of t times g (already negated)
    
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
    
    pPr[0][1]:=K:
    p[0][1]:=0:
    p[0][3]:=1:
    
    return (pPr,p):
    
end proc:

var:=[x,y]:
f:=randpoly(var);
g:=randpoly(var);

F:=Maple2Smp(f,var);
F:=Array(0..nops(F),[[nops(F),nops(F),2],op(F)]):
G:=Maple2Smp(g,var);
a:=1;
H:=Array(0..a,[[0,a,1]]):

#trace(dynSMPadd);
(a1,a2):=dynSMPadd(F,G,H);

L:=[seq(a1[i],i=1..a1[0][1]-1)];
expand(SMP2Maple(L,var)-(f+g));

#SMP2Maple(a1,var);
#SMP2Maple(a2,var);


