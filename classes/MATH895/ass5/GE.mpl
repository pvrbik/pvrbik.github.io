with(LinearAlgebra):

GE:=proc(A,b,m)
local n,B,L,k,i,j,piv:
#   cleaning up
    n:=(Dimensions(A))[1]:
    B:=<A|b>:
    B:=map(rem,B,m,e);
    L:=ilcm(seq(seq(denom(B[i,j]), i=1..n), j=1..n+1)):
    B:=B*L:
    
    for k to n do
        i:=k:
        
        while i<=n and B[i,k]=0 do
            i:=i+1:
        end do:
        
        if i>n then 
            error "A is singular":
        end if:
        
#       interchange rows
        for j from k to n+1 do
            B[i,j],B[k,j]:=B[k,j],B[i,j]:
        end do:
        
        gcdex(B[k,k],m,e,'piv'):
        
        for j from k to n+1 do
            B[k,j]:=rem(piv*B[k,j],m,e):
        end do:
        
        for i from k+1 to n do
            for j from k+1 to n+1 do
                B[i,j]:=rem(B[i,j]-B[i,k]*B[k,j],m,e):
            end do:
            B[i,k]:=0:
        end do:
    end do:
    
    for k from n by -1 to 1 do 
        for j from k-1 by -1 to 1 do
            B[j,n+1]:=rem(B[j,n+1]-B[j,k]*B[k,n+1],m,e):
            B[j,k]:=0;
        end do:
    end do:
        
    return Vector([seq(B[k,n+1],k=1..n)]):
end proc:
