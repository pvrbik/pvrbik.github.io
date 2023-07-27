#interface(quiet=true):

getCyc:=proc(n)
local ds, ps, L:
    
    if n=1 then
        x-1:
    elif isprime(n) then
        add(x^i,i=0..n-1);
    else
        ps:=select(`isprime`,numtheory[divisors](n));
        ds:=seq(n/p, p in ps):
        L:=lcm(seq(x^d-1,d in ds)):
        quo(x^n-1,L,x);
    end if:
    
end proc:

#Part ii
f:=0: i:=0:
while norm(f,infinity)<3 do
    i:=i+1:
    f:=getCyc(i):
end do:

i;

quit:
