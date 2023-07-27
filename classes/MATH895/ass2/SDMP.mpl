LexGt:=proc(A,B) local i:
#Lexically greater than
    
    i:=0:
    while(true)do
        i:=i+1:
        if i>nops(A) then
            return false:
        elif not(A[i]=B[i]) then
            return evalb(A[i]>B[i]):
        end if:
    end do:
    
end proc:

gt:=proc(A,B) local smA, smB:
#gt = greater than
    
    smA:=`+`(op(A)):
    smB:=`+`(op(B)):
    
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

SMPneg:=proc(inA) local i,A:
    A:=inA:
    for i from 1 to nops(A) do
        A[i][1]:=-A[i][1]:
    end do:
    return A:
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