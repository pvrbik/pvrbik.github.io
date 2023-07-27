pord:=proc(A,B):
    if (A[1]=B[1]) then 
        return pord(A[2..-1],B[2..-1]):
    end if:
    return evalb(A[1]>B[1]):
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
    if (A=[]) then
        return B:
    elif (B=[]) then
        return A:
    elif (A[1][2]=B[1][2]) then
        if (A[1][1]+B[1][1] <> 0) then
            return [ [A[1][1]+B[1][1], A[1][2]], op(SMPadd(A[2..-1],B[2..-1])) ]:
        else 
            return SMPadd(A[2..-1],B[2..-1]) 
        end if:
    elif (pord(A[1][2],B[1][2])) then
        return [ A[1], op(SMPadd(A[2..-1],B) )]:
    else
        return [ B[1], op(SMPadd(A,B[2..-1]) )]:
    end if:
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
    if A=[] then return true: end if:
    if A[1][1]=0 then 
        return SMPzero(A[2..-1]) 
    else 
        return false 
    end if:
end proc:

findNeg:=A-> foldr( (x,y)->x or y, op( map(z->evalb(z<0),A) ), false ):

LT:=A->A[1][1]:

SMPdiv:=proc(inA,B,var,Q) local R,x,q, t, SMPx, temp:
    A:=inA:
    if (SMPzero(B)) then return "error"; end if:
    
    myQuo:=[]:
    
    while not(SMPzero(A)) do
        if (irem(LT(A),LT(B),'q')<>0) then return false: end if:
        
        t:=[[q,A[1][2]-B[1][2]]]:
        
        if (findNeg(t[1][2])) then return false: end if:
        
        myQuo:=SMPadd(myQuo,t):
        
        A:=SMPsub(A, SMPmult(B,t,var)):
        
    end do:
       
    if (nargs>3) then Q:=myQuo end if:
    return true:
        
end proc:

#QUESTION 5
var:=[x,y,z]:
a:=randpoly(var,degree=6,terms=15);
b:=randpoly(var,degree=6,terms=15);
A:=Maple2Smp(a,var);
B:=Maple2Smp(b,var);
C:=SMPadd(A,B,var);
expand(a+b-SMP2Maple(C,var));
C:=SMPmult(A,B,var);
expand(a*b-SMP2Maple(C,var));

#QUESTION 6
SMPdiv(A,B,var,'Q'); 
SMPdiv(B,A,var,'Q'); 
SMPdiv(C,A,var,'Q'); SMP2Maple(Q,var);
SMPdiv(C,B,var,'Q'); SMP2Maple(Q,var);

quit();
