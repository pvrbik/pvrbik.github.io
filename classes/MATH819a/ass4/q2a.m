#interface(quiet=true):
myPadic:=proc(f,p) local u, ut, ans:
    
    u:=f:
    ans:=[]:
    
    while (u <> 0) do
        ut:=u mod p:
        ans:=[op(ans),ut]:
        u:=(u-ut)/p:
    end do:
    
    return ans:
    
end proc:

myPadic(28*x^2+24*x+58,3);

`mod`:=mods:
myPadic(28*x^2+24*x+58,3);

quit;