interface(quiet=true):

with(heap):

getRelation:=proc(H)
local t,i:
    t:=[indices(H)]:
    
#   this is usually the case
    if type(t,symbol) then
        return eval(H[t[-1][1]]);
    else
        for i from 1 to nops(t) do
            if type(t[i][1],symbol) then
                return eval(H[t[i][1]]):
            end if:
        end do:
    end if:
end proc:

checkHeap:=proc(H)
local i,N,R:
    
    R:=getRelation(H):
    `&gt`:=(x,y)->not(type(x,indexed)) and (type(y,indexed) or evalb(R(y,x))):
    
    N:=H[0]:
    
    for i from 1 to N do
        if (H[2*i] &gt H[i]) or (H[2*i+1] &gt H[i]) then
            return false:
        end if:
    end do:
    
    return true:
end proc:

takeMax:=proc(H)
local i,j, s, notLeaf, t, R, `&gt`:
#H a heap.
    
    if (empty(H)) then
        error "can't take from empty heap":
    end if:
    
    R:=getRelation(H):
    `&gt`:=(x,y)->type(y,indexed) or evalb(R(y,x)):
#   why is maple heap implementing backwards?
    
    s:=H[0]: t:=H[1]:
    H[0]:=H[0]-1:
    
#   promotions
    i:=1:
    while (2*i<=s) do
        if (H[2*i] &gt H[2*i+1]) then
            H[i]:=H[2*i]:
            i:=2*i:
        else
            H[i]:=H[2*i+1]:
            i:=2*i+1:
        end if:
    end do:
    
#   move last element
    if (i=s) then
        H[s]:=evaln(H[s]):
        return(t):
    else
        H[i]:=H[s]:
        H[s]:=evaln(H[s]):
    end if:
    
#   Heapify (a standard term for re-ordering the heap apparently)
    while (true) do
        j:=floor(i/2);
        if (H[i] &gt H[j]) then
            H[i],H[j]:=H[j],H[i]:
            i:=j:
        else
            return t:
        end if:
    end do:
    
end proc:

with(heap):
H:=new(`<`,1,2,3,4,5);
print(H);
checkHeap(H);
while not(empty(H)) do 
    print(H);
    print(takeMax(H));
    print(checkHeap(H));
end do:

print(H);

