read "common.mpl":

SPOLY:=proc(f,g,LT)
local L,LM:
    LM:=f->LT(f)/lcoeff(f):
    
    L:=lcm(LM(f),LM(g)):
    
    if expand(L-LM(f)*LM(g))=0 then
#   APPLYING POPOSITION 4
        return 0:
    end if:
    
    return expand(L/LT(f)*f-L/LT(g)*g):
end proc:

BBA:=proc(inG,LT)
local G,Gp,i,j,p,q,S,count:
    
    G:={op(inG)}:
    
    for count from 0 while true do
        Gp:=G:
        for i from 1 to nops(Gp) do
            for j from i+1 to nops(Gp) do
                p:=Gp[i]: q:=Gp[j]:
                S:=SPOLY(p,q,LT):
                S:=Division(S,Gp,LT):
                
                if S<>0 then
                    G:=G union {S}:
                end if:
            end do:
        end do:
        
        if G=Gp then return CLEAN(G,LT): end if:
    end do:
    
end proc:

CLEAN:=proc(inG,LT)
#Convert into reduced basis
local G,g,gp:
    
    G:=inG:
    
    for g in inG do
        G:=G minus {g}:
        gp:=Division(g,G,LT):
        if gp <> 0 then 
            G:=G union {gp}:
        end if:
    end do:
    
    return map(f->f/lcoeff(LT(f)),G):
    
end proc:
