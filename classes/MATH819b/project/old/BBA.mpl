read "common.mpl":

SPOLY:=proc(f,g,LT)
#Will return 0 if Prop 4 is satisfied.
local L,LM:
global CountProp4:
    
    LM:=f->f[1]/lcoeff(f[1]): 
   
    L:=lcm(LM(f),LM(g)):
    
    if expand(L-LM(f)*LM(g))=0 then
#   APPLYING POPOSITION 4
        CountProp4:=CountProp4+1:
        return 0:
    end if:
    
    return primpart(expand(L/f[1]*f[2]-L/g[1]*g[2])):
end proc:

BBA:=proc(inG,LT)
local G,Gp,i,j,p,q,S,count:
global CountProp4:
    
#   set global counters
    CountProp4:=0:
    
    G:={seq([LT(g),g],g in inG)}:
    
    while true do
        
        Gp:=G:
        for i from 1 to nops(Gp) do
            for j from i+1 to nops(Gp) do
                p:=Gp[i]: q:=Gp[j]:
                S:=SPOLY(p,q,LT):
                S:=Division(S,Gp,LT):
                
                if S<>0 then
                    G:=G union {[LT(S),S]}:
                end if:
            end do:
        end do:
        
printf("%a \n\n",[seq(g[2], g in G)]);
#        if G=Gp then return CLEAN(G,LT): end if:
        if G=Gp then break: end if:
    end do:
    
printf("Propsition 4 applied %d times \n", CountProp4):
    
    return CLEAN(G,LT):
    
end proc:

CLEAN:=proc(inG,LT)
#Convert into reduced basis
local G,g,gp:
    
    G:=inG:
    
    for g in inG do
        G:=G minus {g}:
        gp:=Division(g[2],G,LT):
        if gp <> 0 then 
            G:=G union {[LT(gp),gp]}:
        end if:
    end do:
    
    G:={seq(g[2],g in  G)}:
    
    return map(f->primpart(f),G):
    
end proc:
