LexGt:=proc(A,B) local i:
#Lexically greater than
    if (nops(A)=0) then
        return false:
    end if:
    
    i:=1:
    while(true)do
        i:=i+1:
        if i=nops(A) or not(A[i]=B[i])then
            break:
        end if:
    end do:
    
    return evalb(A[1]>B[1]):
end proc:

gt:=proc(A,B) local SUM, smA, smB:
#gt = greater than
    
    SUM:=C->foldr( (x,y)->x+y, op(C), 0):
    smA:=SUM(A):
    smB:=SUM(B):
    
    if (smA=smB) then
        LexGt(A,B):
    else 
        evalb(smA>smB):
    end if:
    
end proc:

pord:=proc(A,B)
    return gt(A,B):
end proc:

Maple2Smp:=proc(inF,var) local f,con,n,m;
    f:=expand(inF):
    con:=g->[seq(degree(g,var[i]),i=1..nops(var))]:
    n:=[coeffs(f,var,'m')]:
    m:=[m]:
    return sort( [seq([n[i],con(m[i])],i=1..nops(m))], (x,y)->pord(x[2],y[2]) ):
end proc:

SMP2Maple:=(p,var)->add(map(x->x[1]*mul(zip((a,b)->a^b,var,x[2])[i],i=1..nops(var)),p)[i],i=1..nops(p)):

SMPadd:=proc(A,B)
    
    C:=[]:
    i,j:=1,1:
    
    while (true) do
        if (nops(A)<i) then
            for k from j to nops(B) do
                C:=[C,B[k]]:
            end do:
            break:
        elif (nops(B)<j) then
            for k from i to nops(A) do
                C:=[C,A[k]]:
            end do:
            break:
        elif (A[i][2]=B[j][2]) then
            if (A[i][1]+B[j][1]<>0) then
                C:=[C, [A[i][1]+B[j][1], A[i][2]] ]:
            end if:
            
            i:=i+1:
            j:=j+1:
            
        elif (pord(A[i][2],B[j][2])) then
            C:=[C,A[i]]:
            i:=i+1:
        else
            C:=[C,B[j]]:
            j:=j+1:
        end if:
        
    end do:
    
    return flatten(C);
    
end proc:

SMPneg:=proc(inA) local i,A:
    A:=inA:
    for i from 1 to nops(A) do
        A[i][1]:=-A[i][1]:
    end do:
    return A:
end proc:

SMPsub:=(A,B)-> SMPadd(A,SMPneg(B)):

SMPmult:=proc(A,B,var) local f,g:
    f:=(x0 ,C)->map(x->[x0[1]*x[1],x0[2]+x[2]],C):
    g:=zip(f,A,[seq(B,i=1..nops(A))]):
    foldr( (x,y)->SMPadd(x,y),Maple2Smp(0,var),op(g) ) 
end proc:

SMPzero:=proc(A)
local i:
    
    if (A[0][1]=0) then 
        return true:
    end if:
    
    for i from A[0][3] to A[0][1] do
        if A[i][1]<>0 then
            return false:
        end if
    end do:
    return true:
end proc:

findNeg:=A-> foldr( (x,y)->x or y, op( map(z->evalb(z<0),A) ), false ):

LM:=proc(A)
#leading monomial (not technically a function)
    if A=[] then return []: end if:
    return LT(A)[2]:
end proc:

LC:=proc(A)
#leading coefficent
    return LT(A)[1]:
end proc:

LT:=proc(A):
#leading term
    if (type(A,Array)) then
        if A[A[0][3]][1]=0 then
            A[0][3]:=A[0][3]+1:
            return LT(A):
        else
            return A[A[0][3]]:
        end if:
    elif (type(A,list)) then
        
        if A=[] then return [] end if:
        
        return A[1]:
    else
        error "wrong structure":
    end if:
end proc:

myDiv:=proc(A,B,outT) 
local t:
    
    if (irem(LC(A),LC(B),'q')<>0) then
        return false:
    end if:
    
    t:=[[q,LT(A)[2]-LT(B)[2]]]:
    
    if (findNeg(t[1][2])) then
        return false:
    end if:
    
    outT:=t:
    return true:
    
end proc:

flatten:=proc(A)
local new, i:
    
    if A=[] then return [] end if:
    
    new:=NULL:
    i:=NULL;
    while true do
        new:=A[i,2],new:
        i:=i,1:
        if A[i]=[] then
            break:
        end if:
    end do:
    return [new]:
end proc: