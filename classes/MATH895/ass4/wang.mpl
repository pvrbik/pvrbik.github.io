Wang:=proc(u,m,N,D)
local r0,t0,r1,t1,q,n,d:
    
    r0,t0:=m,0:
    r1,t1:=u,1:
    
    while (r1>N) do
        q:=iquo(r0,r1):
        r0,r1:=r1,r0-q*r1:
        t0,t1:=t1,t0-q*t1:
    end do:
    
    n,d:=r1,t1:
    
    if d<0 then
        n,d:=-n,-d:
    end if:
    
    if d<=D and gcd(n,d)=1 then
        return n/d:
    else
        return FAIL:
    end if:
    
end proc:
