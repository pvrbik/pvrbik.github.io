read "../SDMP.mpl":
read "myQueue.mpl";

oneMerge:=proc(A,B,C)
#merges one element from A, B (or both) into C
local a, b:
        
        if (empty(A)) then
            b:=dequeue(B);
            enqueue(C,b);
            return():
        elif (empty(B)) then
            a:=dequeue(A);
            enqueue(C,a);
            return():
        end if:
        
        a,b:=myFront(A),myFront(B):
        
        if (evalb(a[2]=b[2])) then
            if (a[1]+b[1]=0) then
#               terms cancel:
                dequeue(A):
                dequeue(B):
            else
                enqueue(C,[a[1]+b[1],a[2]]):
                dequeue(A):
                dequeue(B):
            end if:
        elif (gt(a[2],b[2])) then
            enqueue(C,a):
            dequeue(A):
        else
            enqueue(C,b):
            dequeue(B);
        end if:
        return() :
end proc:

extend:=proc(P)
    return Array(0..2*last(P), P):
end proc:

fullMerge:=proc(A,B,inC)
#merge A,B into C
local C:
    C:=inC:
    while not(empty(A)) or not(empty(B)) do
        
        if (last(C)=C[0][2]) then
            C:=extend(C):
        end if:
        oneMerge(A,B,C):
        
    end do:
    
    return C:
    
end proc:

Geo2Maple:=proc(B,var)
local i,j,L,f,t:
    f:=0:
    for i from 0 to last(B) do
        L:=LENGTH(B[i]);
        for j from 1 to L do
            t:=dequeue(B[i]);
            f:=f+SMP2Maple([t],var):
        end do:
    end do:
    
    return f:
end proc:

MkGeoBuck:=proc(f)
local n, p, i:
    
    n:=ilog2(nops(f)+1)-1:
    p:=Array(0..n+1):
    
    for i from 0 to n do
        p[i]:=new(f[2^i..2^(i+1)-1],2^i):
    end do:
    
    p[i]:=new(f[2^(i)..-1],2^i):
    
    return p:
    
end proc:

last:=x->[op(ArrayDims(x))][2]:

myFront:=proc(A)
    
    if empty(A) then
#       the element will always be smaller
        return [-infinity,[-infinity]]:f
    else
        return front(A):
    end if:
    
end proc:

myCopy:=proc(A,B)
#copies A into B
    
    clear(B):
    
    while not(empty(A)) do
        enqueue(B,dequeue(A)):
    end do
    
end proc:

getLT:=proc(B)
local i,j, LT, k, temp:
    
    k:=last(B):
#   my arrays are zero indexed hence:
    j:=-1:
    i:=0:
    
    while(i<=k) do
        if not(empty(B[i])) and (j=-1 or gt(front(B[i])[2],front(B[j])[2])) then
            j:=i:
        elif not(empty(B[i])) and evalb(front(B[i])[2]=front(B[j])[2]) then
            temp:=[front(B[j])[1]+front(B[i])[1],front(B[j])[2]]:
#           Make front(B[j]) temp. (I know this is ugly but its a one time thing).
            B[j][B[j][0][1]]:=temp:
            
            dequeue(B[i]):
        end if:
        i:=i+1:
    end do:
    
    if j=-1 then
        return 0:
    end if:
    
    if front(B[j])[1]=0 then
        dequeue(B[j]):
        return getLT(B):
    end if:
    
    return dequeue(B[j]):
    
end proc:

GeoAdd:=proc(inB,inF,inP)
local B,f,p,j:
    
    B:=inB:
    f:=inF:
    p:=inP:
    
    j:=ilog2(LENGTH(f))+1:
    
    while (true) do
        
        clear(p):
        
#       does bucket exist?
        if (j>last(B)) then
            B:=AddBucket(B):
        end if:
        
        p:=fullMerge(B[j],f,p):
        
#       does it fit?
        if (LENGTH(p)<=2^j) then
            myCopy(p,B[j]):
            break:
        end if:
        
        clear(B[j]):
        j:=j+1:
        f,p:=eval(p),eval(f):
        
    end do:
    
    return B:
    
end proc:

AddBucket:=proc(G)
local newG, Lg:
    
    Lg:=last(G):
    newG:=Array(0..Lg+1,G):
    newG[Lg+1]:=new([],2^(Lg+1)):
    return newG:
    
end proc:

