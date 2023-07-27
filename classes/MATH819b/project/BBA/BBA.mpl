read "common.mpl":

BBA:=proc(inF,LT)
local G,t,B,Criterion,i,j,S,k,L:
global CountProp4, CountProp10:
#initializ global counters
CountProp4:=0:
CountProp10:=0:
    
    if nargs > 2 then
        MoreInfo:=true:
    else
        MoreInfo:=false:
    end if:
    
    G:=[seq( [LT(g),g], g in inF)]:
    t:=nops(G):
    B:=[seq( seq([i,j],i=1..j-1) ,j=2..t)]:
    
    Criterion2:=proc(f,g)
#   Proposition 4
    local L,LM:
    global CountProp4:
        
        LM:=f->f[1]/lcoeff(f):
        
        L:=lcm(LM(f),LM(g)):
        
        if expand(L-LM(f)*LM(g))=0 then
CountProp4:=CountProp4+1:
            return true:
        end if:
        
        return false:
        
    end proc:
    
    Criterion1:=proc(i,j,t)
#   Proposition 10
    global CountProp10:
        
        for k from 1 to t do
            
            if not(k=i or k=j) 
            and not( (k>i and [i,k] in B) or (i>k and [k,i] in B) ) 
            and not( (k>j and [j,k] in B) or (j>k and [k,j] in B) ) then
                
                L:=lcm( G[i][1] , G[j][1] ):
                
                if divide( L, G[k][1] ) then
CountProp10:=CountProp10+1:
                    return true:
                end if:
                
            end if:
            
        end do:
        
        return false:
        
    end proc:
    
    while nops(B) <> 0 do
        
        if MoreInfo then
            printf("G=%a \n",[seq(g[1],g in G)]);
        end if:
        
        i,j:=op(B[1]):
        B:=B[2..-1]:
        
        if not ( Criterion2(G[i],G[j]) or Criterion1(i,j,t) ) then
            
            S:=SPOLY(G[i],G[j]):
            S:=Division(S,G,LT):
            S:=primpart(S):
            
            if S<>0 then
                t:=t+1:
                G:=[op(G),[LT(S),S]]:
                B:=[op(B),seq( [i,t], i=1..t-1 )]:
            end if:
            
        end if:
        
    end do:
    
printf("Propsition 4 applied %d times \n", CountProp4):
printf("Propsition 10 applied %d times \n", CountProp10):
    
    return CLEAN(G,LT):
    
end proc:

SPOLY:=proc(f,g)
local L,LM:
    
    LM:=f->f[1]/lcoeff(f):
    
    L:=lcm(LM(f),LM(g)):
    
    return primpart(expand(L/f[1]*f[2]-L/g[1]*g[2])):
end proc:

CLEAN:=proc(inG,LT)
#Convert into reduced basis
local G,g,gp,ans:
    
    G:={op(inG)}:
    
    for g in inG do
        G:=G minus {g}:
        gp:=Division(g[2],G,LT):
        gp:=primpart(gp):
        if gp <> 0 then 
            G:=G union {[LT(gp),gp]}:
        end if:
    end do:
    
    G:={seq(g[2],g in  G)}:
    
    ans:=map(f->primpart(f),G):
    ans:=map(f->sign(LT(f))*f,G):
    
    return ans:
    
end proc:
