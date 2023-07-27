#interface(quiet=true):

SquareAdic:=proc(a,u0,p)
local f,k,err,u,uk:
    `mod`:=mods:
    f:=u->simplify(a-u^2) mod p:
    
    u:=u0:
    k:=1:
    err:=f(u):
    
    while (true) do
        if (err=0) then 
            return u:
        elif (degree(u,x)>floor(degree(a,x)/2)) then
            return ERROR ("No square exists1"):
        end if:
        
        if not(Divide( err, x^k*2*u0, 'q') mod p) then
            return ERROR("No square exists2");
        end if:
        
        uk:= Rem(q,x,x) mod p:
        printf("u%d: %d \n",k,uk);
        err:=simplify(err-2*u*uk*x^k-(uk*x^k)^2) mod p:
        u:=u+uk*x^k:
        k:=k+1;
    end do:

end proc:

`mod`:=mods:

p:=101;

#this is a1
a1:=81*x^6+16*x^5+24*x^4+89*x^3+72*x^2+41*x+25 mod p;
u0:=5;
g:=SquareAdic(a1,u0,p);
(expand(g^2) mod p=f mod p);

#this is a2
a2:=81*x^6+46*x^5+34*x^4+19*x^3+72*x^2+41*x+25 mod p;
u0:=5;
SquareAdic(a2,u0,p);

quit: