interface(quiet=true):
read "SDMP.mpl":
read "dynAdd.mpl":
!clear

SMPdiv:=proc(f,g,var)
local r,p,pPr,q,t,rtg:
    
    p:=Array(0..nops(f),[[nops(f),nops(f),1],op(f)]):
    pPr:=Array(0..nops(f),[[0,nops(f),1]]):
#   p[0]=[Current length, Total length, Head]
    
    r:=Maple2Smp(0,var):
    q:=Maple2Smp(0,var):
    
    while not(SMPzero(p)) do
        
        if (irem(LC(g),LC(p),'quot')<>0) then
            r:=SMPadd(r,[LT(p)]):
#           delete leading term of p
            p[0][3]:=p[0][3]+1:
            
        else
            
            t:=[[quot,LT(p)[2]-LT(g)[2]]]:
            
            if (findNeg(t[1][2])) then
                r:=SMPadd(r,[LT(p)]):
#               delete leading term of p
                p[0][3]:=p[0][3]+1:
            else
                q:=SMPadd(q,t):
#               calculate (-t)*rest(g)
                rtg:=SMPmult(SMPneg(t),g[2..-1],var):
                (p,pPr):=dynSMPadd(p,rtg,pPr):
            end if:
            
        end if:
        
    end do:
    
    return (r,q):
    
end proc:

mkArray:=A->Array(0..nops(A), [[nops(A),nops(A),1], op(A)]):

var:=[x,y]:
h:=x+1:
f:=x^2*y^2+x*y+1:
g:=x^2+y^2+1:
f:=expand(f*g+7);
g:=expand(g);
gcd(f,g);

divide(f,g,'q'); q;

F:=Maple2Smp(f,var);
G:=Maple2Smp(g,var);

#trace(SMPdiv);
#trace(dnySMPadd);
(r,q):=SMPdiv(F,G,var);
q:=SMP2Maple(q,var);
r:=SMP2Maple(r,var);

expand(f-(q*g+r) );
