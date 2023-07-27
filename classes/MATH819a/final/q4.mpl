#interface(quiet=true):
####Question 3###
####PAUL VRBIK###
####301056796 ###

ModDiv:=proc(A,inB, pBound) local p,P,ans,up,B:
    
    B:=primpart(inB,x,'cntB');
    
    p:=100:
    P:=1:
    ans:=1:
    while (P<pBound) do
        
        p:=nextprime(p);
        
        up:=Quo(A,B,x,'rp') mod p:
        
        if (rp<>0) then
            return "false";
        end if:
        
        ans:=chrem([up,ans],[p,P]);
        P:=P*p:
        
    end do:
    
    return ans/cntB;
    
end proc:


###Part (A)###
B:=1234*x^2+4321*x+2222;
Q:=1357*x^2+7531*x+3333;
A:=expand(B*Q);

divide(A,B,'q'); q;

pbnd:=norm(A,infinity);
ModDiv(A,B,pbnd);

quit;
