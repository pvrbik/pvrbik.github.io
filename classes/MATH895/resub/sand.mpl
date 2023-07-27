interface(quiet=true):
read "SDMP.mpl":

ADD:=proc(A,B)
    
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

var:=[x,w,v,y,z]:
f:=randpoly(var);
#g:=randpoly(var);
g:=-f+randpoly(var);;

#var:=[x,y];
#f:=x^2;
#g:=y^2;

F:=Maple2Smp(f,var):
G:=Maple2Smp(g,var):

H:=ADD(F,G);

expand(SMP2Maple(H,var)-f-g);

