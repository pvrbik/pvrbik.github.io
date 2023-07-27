read "common.mpl":

BBA:=proc(inF,LT)
local G,t,B,Criterion,i,j,S,k,L:
global CountProp4, CountProp10:
#initializ global counters
CountProp4:=0:
CountProp10:=0:
    
    G:=[seq(g, g in inF)]:
    t:=nops(G):
    B:={seq( seq([i,j],i=1..j-1) ,j=2..t)}:
    
    Criterion:=proc(i,j,t)
    global CountProp10:
        
        for k from 1 to t do
            
            if not(k=i or k=j) 
            and not( (k>i and [i,k] in B) or (i>k and [k,i] in B) ) 
            and not( (k>j and [j,k] in B) or (j>k and [k,j] in B) ) then
                
                L:=lcm( LT(G[i]) , LT(G[j]) ):
                
                if divide( L, LT(G[k]) ) then
CountProp10:=CountProp10+1:
                    return true:
                end if:
                
            end if:
            
        end do:
        
        return false:
        
    end proc:
    
    while nops(B) <> 0 do
        i,j:=op(B[1]):
        
        if not Criterion(i,j,t) then
            S:=SPOLY(G[i],G[j],LT):
            S:=Groebner[NormalForm](S,G,plex(op(var))):
            
            if S<>0 then
                t:=t+1:
                G:=[op(G),S]:
                B:=B union {seq( [i,t], i=1..t-1 )}:
                
            end if:
            
#printf("%a \n\n",G);
            
        end if:
        
        B:=B minus { [i,j] }:
        
    end do:
    
printf("Propsition 4 applied %d times \n", CountProp4):
printf("Propsition 10 applied %d times \n", CountProp10):
    
    G:=[seq( [LT(g),g], g in G)]:
    return CLEAN(G,LT):
    
end proc:

SPOLY:=proc(f,g,LT)
local L,LM:
global CountProp4:
    
    LM:=f->LT(f)/lcoeff(f):
    
    L:=lcm(LM(f),LM(g)):
    
    if expand(L-LM(f)*LM(g))=0 then
#   APPLYING POPOSITION 4
CountProp4:=CountProp4+1:
        return 0:
    end if:
    
    return primpart(expand(L/LT(f)*f-L/LT(g)*g)):
end proc:

CLEAN:=proc(inG,LT)
#Convert into reduced basis
local G,g,gp:
    
    G:={op(inG)}:
    
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
