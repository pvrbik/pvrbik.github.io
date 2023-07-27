MQRR:=proc(u,m,inT)
local n,d,t0,r0,t1,r1,q,T:
    
    T:=inT:
    
    if u=0 then
        if m>T then
            return 0:
        else
            return FAIL:
        end if:
    end if:
    
    n,d:=0,0:
    t0,r0:=0,m:
    t1,r1:=1,u:
    
    while r1<>0 and r0>T do
        q:=iquo(r0,r1):
        if q>T then
            n,d,T:=r1,t1,q:
        end if:
        r0,r1:=r1,r0-q*r1:
        t0,t1:=t1,t0-q*t1:
    end do:
    
    if d=0 or gcd(n,d)<>1 then 
        return FAIL:
    elif d<0 then
        n,d:=-n,-d:
    end if:
    
    return n/d:
    
end proc: