Adjust:=proc(cs,adj)
local ans, i, B, Bs, x, As, eqn, LC, testB:
    
    Bs:=[ seq( B[i], i=1..nops(cs)) ]:
    x:=`+`( op(zip( `*`, Bs, cs, 0)) );
    
    As:=[ seq(A[i], i=1..nops(cs)) ]:
    for i from nops(cs) to 1 by -1 do
        eqn:= As[i] = `+`(op(zip(`*`,adj[i],Bs)));
        x:=subs( B[i]=solve( eqn, B[i] ), x);
    end do:
    
    expand(x);
    
    return [seq( coeff( x, A[i]), i=1..nops(cs) )]:
end proc:

MultiDeg:=proc(f::polynom)
    return [seq( degree(f,t), t in var)]:
end proc:

MkMon:=(L,var)->`*`(op(zip(`^`,var, L))):

NextMon:=proc(inf,G)
local F,i,f,j, ord, LT:
    
    ord:=plex(op(var)):
    LT:=f->`*`(Groebner[LeadingTerm](f,ord)):
    
    F:=MultiDeg(inf):
    
    for i from nops(F) to 1 by -1 do
        
        F[i]:=F[i]+1:
        f:=MkMon(F,var):
        
        for j from 1 to nops(G) do
            if divide(f,LT(G[j])) then
                F[i]:=0:
                break:
            end if:
        end do:
        
        if F[i]<>0 then return f: end if:
        
    end do:
    
    if F[1]=0 then return FAIL: end if:
    
end proc:

AddB:=proc(bs,inB)
local LM,LC,i,T,LTf,LCf,LT,ord,b,Pivots,LMb,piv:
    if nops(bs)=0 then return [inB],[1]: end if:
    
    ord:=plex(op(var)):
    LT:=f->`*`(Groebner[LeadingTerm](f,ord)):
    LM:=f->(Groebner[LeadingTerm](f,ord))[2]:
    LC:=f->(Groebner[LeadingTerm](f,ord))[1]:
    
    b:=inB:
    
    for i from 1 to nops(bs) do
        Pivots[i]:=0:
    end do:
    
    Pivots[nops(bs)+1]:=1:
    
    while b<>0 do 
        
        LMb:=LM(b):
        
        for i from 1 to nops(bs) do
            if LM(bs[i]) = LMb then
                piv:= LC(b)/LC(bs[i]):
                b:=expand(b-piv*bs[i]):
                Pivots[i]:=piv:
                break:
            end if:
        end do:
        
        if i>nops(bs) then break: end if:
        
    end do:
    
    return [op(bs),b], [seq(Pivots[i], i=1..nops(bs)+1)]:
    
end proc:

LinComb:=proc(inF::polynom,bs)
#return FAIL if no linear combination is possible
local LM,cs,LMf,LMg,LCg,f,g,i,ord,LT, LC:
    
    f:=inF:
    if nops(bs)=0 then return FAIL: end if:
    
    ord:=plex(op(var)):
    LT:=f->`*`(Groebner[LeadingTerm](f,ord)):
    LM:=f->(Groebner[LeadingTerm](f,ord))[2]:
    LC:=f->(Groebner[LeadingTerm](f,ord))[1]:
    
    for i from 1 to nops(bs) do
        cs[i]:=0:
    end do:
    
    while f<>0 do
        
        LMf:=LM(f):
        
        for i from 1 to nops(bs) do
            g:=bs[i]:
            LMg:=LM(g):
            
            if LMf = LMg then
                LCg:=LC(g):
                cs[i]:=LC(f) / LCg:
                f:=expand(f-cs[i]*g):
                break:
            end if:
            
        end do:
        
        if i > nops(bs) then
            return FAIL:
        end if:
        
    end do:
    
    return [ seq(cs[i], i=1..nops(bs)) ]:
    
end proc:
