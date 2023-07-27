interface(quiet=true):
read "geoCommon.mpl":
read "../SDMP.mpl":
read "checkLT.mpl":

show:=proc(G)
local i:
    
    for i from 0 to last(G) do
        printf("G[%d]=\n",i);
        print(G[i]);
    end do:
    
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

trace(getLT);
print("asd");
show(p);

getLT(p);
