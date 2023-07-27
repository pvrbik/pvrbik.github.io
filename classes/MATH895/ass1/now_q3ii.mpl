#interface(quiet=true):

read "procs.mpl":

myGCD:= proc(inA,inB)
local a,b,cd, L, r:
    
    (a,b):=(inA,inB):
    
    L:=ilog2(b):
    
    while ilog2(b)>10 do
        
        cd:=Matrix(HGCD(a,b)).<a,b>:
        (a,b):=(cd[1],cd[2]):
        
        if (a<b) then
            (a,b):=(b,a):
        elif (b=0) then
            return a:
        end if:
        
        r:=irem(a,b):
        
        if r=0 then 
            return b:
        end if:
        
        (a,b):=(b,r):
        
    end do:
    
    return igcd(a,b):
    
end proc:

a:=310721884527175090512728318620127574773113333564930596117254496:
b:=30579606817579521526914773950612993396749789377203153517874624:
igcd(a,b);
myGCD(a,b);

g:=456:
a:=g*rand(10^80)():
b:=g*rand(10^80)():
igcd(a,b);
myGCD(a,b);

g:=nextprime(456):
a:=g*rand(10^80)():
b:=g*rand(10^80)():
igcd(a,b);
myGCD(a,b);

quit:
