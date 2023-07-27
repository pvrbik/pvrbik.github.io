#ADDITION QUESTION 2
interface(quiet=true):

s:=4;

B:={ seq( seq( [i,j], i=1..j-1), j=2..s ) };

Criterion:=proc(i,j,t)
#t is largest index
local n, Now, Rest:
    
    for k from j+1 to t do
        Now,Rest:=selectremove( x->x[2]=k, B):
        Now:=select( x-> x[1]=i or x[1]=j, Now):
        
        if nops(Now)=0 then
            return true,[i,k],[j,k]:
        end if:
        
    end do:
    
    return false:
    
end proc:

trace(Criterion):
Criterion(2,3,s);

quit:

read "common.mpl":
read "BBA.mpl":

var:=[x,y,z]:

f1:=3*x-6*y-2*z:
f2:=2*x-4*y+4*w:
f3:=x-2*y-z-w:

G:=[f1,f2,f3];

Groebner[Basis](G,plex(op(var)));
BBA(G,LTlex);

quit: