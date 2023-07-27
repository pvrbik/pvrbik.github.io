
CRT:=(u,m)-> h_CRT(u,m, mul(m[i],i=1..nops(m))):

h_CRT:=proc( u, m, M) local ubar, v1,v2:
    
    if (nops(u)=1) then
        return u[1] mod m[1]:
    end if:
    
    ubar:=CRT(u[2..-1],m[2..-1], M/m[1]):
    v1:=u[1]/(M/m[1]) mod m[1]:
    v2:=ubar/m[1] mod (M/m[1]);
    
    return (v1*(M/m[1]) + v2*m[1]) mod M:

end proc:

CRT([3,1,3],[5,7,9]);

quit: