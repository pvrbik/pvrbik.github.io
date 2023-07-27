interface(quiet=true):
read "../SDMP.mpl":
read "geoCommon.mpl":
read "myQueue.mpl":

show:=proc(GB)
local i:
    
    for i from 0 to last(GB) do
        print(GB[i]);
    end do:
    
end proc:

DynCopy:=proc(A,inB)
#copies A::list into B::queueu
local B,i:
    B:=inB:
    for i from 1 to nops(A) do
        
        if (i>last(B)) then
            B:=Array(0..2*last(B),B):
        end if:
        
        enqueue(B,A[i]):
        
    end do:
    return B:
end proc:


A:=[1,2,3];
B:=new([],1);

B:=myDynCopy(A,B);

print(B);

while(not(empty(B)))do
    print(dequeue(B));
end do:

quit;

var:=[x,y]:
f:=randpoly(var,terms=6):
g:=randpoly(var,terms=3)-f:
F:=Maple2Smp(f,var);
G:=Maple2Smp(g,var);

B:=MkGeoBuck(F):
show(B);
print("here");

gg:=new(G,2^4);
p:=new([],2^4);
empty(p);

B:=GeoAdd(B,gg,p):

ans:=Geo2Maple(B,var):

expand(f+g-ans);

quit:
