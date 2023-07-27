HalfGCD:=proc(c,d)
local a,b,n,H,A:
    (a,b):=(c,d):
    n:=ilog2(a):
    H:=2^iquo(n+1,2):
    A:=[[1,0],[0,1]]:
    
    while abs(b)>H do
        (a,b):=(b,irem(a,b,'q')):
        A:=[A[2],A[1]-q*A[2]]:
    end do:
    
    return A:
end:

HGCD:=proc(a,b)
local n,m,a1,b1,A1,r,r1,d1,A2,A,CnD,c,d,k:
    
    n:=ilog2(a):
    m:=iquo(n+1,2):
    
    if (n<100) then
        return HalfGCD(a,b):
    end if:
    
    a1:=iquo(a,2^m):
    b1:=iquo(b,2^m):
    
    A1:=HGCD(a1,b1):
    A1:=Matrix(A1):
    
    CnD:=A1.<a,b>:
    c:=CnD[1]:
    d:=CnD[2]:
    
    r:=irem(c,d,'q'):
    
    A1:=Matrix([[0,1],[1,-q]]).A1:
    
    k:=iquo(m+1,2);
    
    r1:=iquo(r,2^k):
    d1:=iquo(d,2^k):
    
    A2:=HGCD(d1,r1):
    
    A:=Matrix(A2).A1:
    
    return [[A[1,1],A[1,2]],[A[2,1],A[2,2]]]:
    
end proc:
