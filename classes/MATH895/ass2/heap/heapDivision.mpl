read "../SDMP.mpl":
read "myheaps.mpl":

ADD:=proc(A,B)
local ADD:
    
    if A=[] then
        return B:
    elif B=[] then
        return A:
    end if:
    
    C:=A[1][1]+B[1][1]:
    
    if C=0 then return [] end if:
    
    return [[C,A[1][2]]]:
    
end proc:

HeapDiv:=proc(f,g,var)
local q,r,s,H,t,X,i,j,MULT,R:
    interface(quiet=true):
    if (f[1][1]=0) then return 0 end if:
    
    MULT:=(A,B)->[[A[1]*B[1], A[2]+B[2]]]:
    q:=[]:
    r:=[]:
    s:=nops(g):
    
    H:=new( (y,x)->gt(x[1][1][2],y[1][1][2]), [SMPneg([f[1]]),1] ):
#    R:=getRelation(H):
    R:=(y,x)->gt(x[1][1][2],y[1][1][2]):
    
    while not(empty(H)) do
        
        t:=[]:
        
        while (true) do
            X:=takeMax(H,R);
#            X:=extract(H);
            
            t:=ADD(t,SMPneg(X[1])):
            
            if nops(X)=2 and X[2]<nops(f) then
                i:=X[2]:
                insert( [SMPneg([f[i+1]]),i+1], H):
            elif nops(X)=3 and X[3]<nops(q) then
                i:=X[2]:
                j:=X[3]:
                
                insert([MULT(g[i], q[j+1]),i,j+1],H):
                
            elif nops(X)=3 and X[3]=nops(q) then
                s:=s+1:
            end if:
            
#       until
        if empty(H) or not(LM(t)=LM(max(H)[1])) then break: end if:
        end do:
        
        if t<>[] and not(myDiv(t,[LT(g)],'C')=false) then
            
            q:=[op(q),op(C)]:
            j:=nops(q):
            
            for i from 2 to s do
                insert( [ MULT(g[i],q[j]) ,i,j],H);
            end do:
            
            s:=1:
        else
            r:=[op(r),op(t)]:
        end if:
        
    end do:
    interface(quiet=false):
    return (q,r):
    
end proc: