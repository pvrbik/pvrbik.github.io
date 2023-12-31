#interface(quiet=true):
####Question 3###
####PAUL VRBIK###
####301056796 ###

CRT:=proc(n,u,m) local M,U,k,i,T,V:
    
    `mod`:=mods:
    
    M:=1:
    U:=0:
    
    for k from 1 to n do
        i:= (1/M) mod m[k]:
        T:=U mod m[k]:
        V:=i*(u[k]-T) mod m[k]:
        U:=U+V*M:
        M:=M*m[k]:
    end do:
    return U:
end proc:

TIMEone:=proc(n) local p,m,i,u,st,tt:
    
    p:=2^30;
    m:=array(1..n);
    for i to n do 
        p:=prevprime(p);
        m[i]:=p;
    end do:
    u:=[seq(i,i=1..n)];
    
    st:=time();
        CRT(n,u,m):
    tt:=time()-st;
    
    return tt;
    
end proc:

####Part (A)###
u:=[1,3,1];
m:=[11,13,17];
chrem(u,m);
CRT(nops(u),u,m);

####Part (B)###
x:=14;
t1:=TIMEone(2^x);
t2:=TIMEone(2^(x+1));

evalf(t2/t1);
#Since doubling the input causes the time to increase by (approximately) a factor of four we can conclude the the time complexity is O(n^2).

quit;