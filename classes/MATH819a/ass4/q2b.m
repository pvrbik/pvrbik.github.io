myPadic:=proc(f,p) local u, ut, ans:
    `mod`:=mods:
    
    u:=f:
    ans:=[]:
    
    while (u <> 0) do
        ut:=u mod p:
        ans:=[op(ans),ut]:
        u:=(u-ut)/p:
    end do:
    
    return ans:
    
end proc:

pos:=proc(f)
    if coeff(f,x,degree(f,x))<0 then
        return -f;
    else
        return f;
    end if:
end proc:

cubeRoot:=proc(F,p,u0,B)
local dF, ubar, k, err, t, uk:
    `mod`:=mods;
    
    dF:=expand(eval(diff(F(u),u),u=u0)) mod p:
    
    ubar:=u0:
    k:=1:
    err:=F(ubar);
            
    while (true) do
        
        if err=0 then
            return ubar:
        elif p^k > 2*B then
            return ERROR("cube root does not exist 1");
        end if:
        
        t:=(err / p^k) mod p;
        
        if not(Divide(t,dF,'q') mod p) then 
            return ERROR("cube root does not exist 2");
        end if:
        
        uk:=-q:
        err:=simplify(err-3*ubar^2*uk*p^k-3*ubar*uk^2*p^(2*k)-uk^3*p^(3*k));
        ubar:=(ubar+uk*p^k):
        
        k:=k+1:

    end do

end proc:

a:=x^6-531*x^5+94137*x^4-5598333*x^3+4706850*x^2-1327500*x+125000;

factor(a);
F:=u->simplify(a-u^3):
p:=5:
u0:=x^2+3*x:

ans:=cubeRoot(F,5,u0,2*iroot(5598333,3));

myPadic(ans,p);

b:=x^6-406*x^5+94262*x^4-5598208*x^3+4706975*x^2-1327375*x+12125;

factor(b);
F:=u->simplify(b-u^3):
p:=5:
u0:=x^2+3*x:

cubeRoot(F,5,u0,2*iroot(5598333,3));
#and it certainly shouldn't since there is no integer cube root of 125125

quit;
