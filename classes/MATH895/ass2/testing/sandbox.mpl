interface(quiet=true):
read "SDMP.mpl":
!clear

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
    
end proc:

var:=[x,y]:
f:=4*y^5*x^3;
g:=-x^3*y;

F:=Maple2Smp(f,var);
G:=Maple2Smp(g,var);

trace(myDiv);
myDiv([LT(F)],[LT(G)],t);
t;
SMP2Maple(t,var);