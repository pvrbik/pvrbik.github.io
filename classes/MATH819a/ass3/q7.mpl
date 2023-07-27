
Maple2Smp:=proc(f,var) local i:
#   note Maple2Smp(0,var) = 0 NOT [0]
#   this line is required since degreee(0,x)=-infinity
    if (f=0) then return 0: end if:
    if (var=[]) then return f: end if:
    [seq(Maple2Smp(coeff(f,var[1],i),var[2..-1]),i=0..degree(f,var[1]))];
end proc:

Smp2Maple:=proc(f,var)

    if (type(f,numeric)) then return f: end if:
    
    return add(var[1]^i*Smp2Maple(f[i+1],var[2..-1]), i=0..nops(f)-1):

end proc:

SMPzero:=proc(A) local f:

    f:=x->evalb(x=0):
    
    if (type(A,numeric)) then
        return f(A)
    end if:
    
    foldr(`and`, true, op(map(SMPzero,A))):

end proc:

SMPsimp:=proc(A)

    if (SMPzero(A[-1])) then return SMPsimp(A[1..-2]): end if:
    return A:

end proc:

h_SMPadd:=proc(A,B):
    
    if (A=0) then return B: 
    elif (B=0) then return A:
    elif (type(A,numeric)) then
        return A+B:
    end if:
    
    return zip((x,y)->h_SMPadd(x,y),A,B,0):
    
end proc:

SMPadd:=proc(A,B) local temp:
    temp:=h_SMPadd(A,B):
    if SMPzero(temp) then return 0: end if:
    return SMPsimp(temp):
end proc:

SMPneg:=proc(B)
    if type(B,numeric) then
        return -B:
    end if:
    
    return map(SMPneg,B):
end proc:

SMPsub:=(A,B)-> SMPadd(A,SMPneg(B)):

SMPpow:=proc(A,n)
    if (n=0) then return 1: end if:
    
    return SMPmult(A, SMPpow(A,n-1)):
    
end proc:

SMPmult:=proc(A,B) local Bt,C,ans,i:
    
    if (A=0 or B=0) then 
        return 0:
    elif (type(A,numeric) and type(B,numeric)) then 
        return A*B:
    elif (type(A,numeric)) then
        return SMPmult([A],B):
    elif (type(B,numeric)) then
        return SMPmult(A,[B]):
    end if:
    
    ans:=0:
    
    for i from 1 to nops(A) do
        Bt:=B:
        C:=map(x->SMPmult(A[i],x),Bt):
        C:=[seq(0,j=0..i-2),op(C)]:
        ans:=SMPadd(ans,C):
    end  do:
    
    return ans:
    
end proc:

deg:=proc(F)
    if (F=0) then return -infinity: end if:
    nops(F);
end proc:

SMPdiv:=proc(A,B,var,Q) local R,q,lco,temp,x,t;
    
    lco:=F->F[-1]:
    
    if (B=0) then return "error": end if:
    
    if type(A,numeric) and type(B,numeric) then
        if (irem(A,B,'q')=0) then
            if nargs>3 then Q:=q: end if:
            return true:
        end if:
        
        return false:
    end if:
    
    R:=A:
    x:=Maple2Smp(var[1],var):
    q:=0;
    
    while deg(R) >= deg(B) do
        if (SMPdiv(lco(R), lco(B), var[2..-1],'t')) then
            t:=[t];
            
            temp:=SMPpow(x, deg(R)-deg(B)):
            temp:=SMPmult(t,temp):
            
            q:=SMPadd(q,temp):
            
            temp:=SMPmult(temp,B):
            
            R:=SMPsub(R,temp):
        else return false:
        end if:
    end do:
    
    if (SMPzero(R)) then
        if nargs>3 then Q:=q: end if:
            return true:
        else return false:
    end if:
    
end proc:

var:=[x,y,z];
a:=randpoly([x,y,z], degree=6, terms=15);
b:=randpoly([x,y,z], degree=6, terms=15);
A:=Maple2Smp(a,var);
B:=Maple2Smp(b,var);
C:=SMPadd(A,B,var);
expand(a+b - Smp2Maple(C,var));
C:=SMPmult(A,B);
expand(a*b - Smp2Maple(C,var) );
SMPdiv(A,B,var);
SMPdiv(C,B,var);
if SMPdiv(C,A,var,'Q') then expand(b-Smp2Maple(Q,var)) else "error" fi;
