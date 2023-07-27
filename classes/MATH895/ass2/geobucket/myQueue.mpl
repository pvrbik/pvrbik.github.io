#I made an environment for Queues using fixed sized arrays.
#let A[0]=[head postion, tail position]

new:=proc(L,size)
#L a list
local A:
    
    if nargs>1 then
        A:=Array(0..size,[[0,0],op(L)]):
        A[0]:=[1,nops(L)];
    else
        A:=Array(0..nops(L),[[0,0],op(L)]):
        A[0]:=[1,nops(L)]:
    end if:
    
    return A:
    
end proc:

enqueue:=proc(A,x)
local LAST:
    
    LAST:=A[0][2]:
    
    if LAST=last(A) then
        print(A);
        error "you exceeded bucket size":
    else
        A[LAST+1]:=x:
        A[0][2]:=LAST+1:
    end if:
    return():
    
end proc:

dequeue:=proc(A)
local t:
    
    if empty(A) then
        return "FAIL":
    else
        t:=front(A):
        A[0][1]:=A[0][1]+1:
        return t;
    end if:
    
end proc:

front:=proc(A)
    
    return A[A[0][1]];
    
end proc:

LENGTH:=proc(A)
    
    return A[0][2]-A[0][1]+1;
    
end proc:

clear:=proc(A)
    A[0]:=[1,0];
    return():
end proc:

empty:=proc(A) 
    
    if (A[0][2]<A[0][1]) then
        return true:
    else    
        return evalb(LENGTH(A)=0):
    end if:
    
end proc:
