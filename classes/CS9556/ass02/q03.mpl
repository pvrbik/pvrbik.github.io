interface(quiet=true):

f:=proc(n)
    if n=0 then
        return 1;
    elif n=1 then
        return 2;
    else
        return 0;
    end if;
end proc:

g:=proc(n)
    if n=0 then
        g(0):=1;
        return g(0);
    elif n=1 then
        g(1):=f(1)/2;
        return g(1);
    else
        g(n):=( f(n) - add( g(k)*g(n-k), k=1..n-1 ) )/2;
        return g(n);
    end if;
end proc:

G:=0;
for i from 0 to 10 do
    G:=G+g(i)*x^i;
end do:

latex(G);

expand(G^2);

quit: