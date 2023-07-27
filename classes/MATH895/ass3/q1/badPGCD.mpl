badPGCD:=proc(inA,inB,p,var)
local A,B,xk,C,c,lcA,lcB,g,q,H,n,b,gb,Ab,Bb,Cb,m,lcC,qs,Hs,Hold,d,bi:
    A:=inA:
    B:=inB:
    
    xk:=var[-1]:
    
    if nops(var)=1 then
        C:=Gcd(A,B) mod p:
        if degree(C)=0 then
            C:=1:
        end if:
        return C:
    end if:
    
    A:=Primpart(A,var[1..-2],'a') mod p:
    B:=Primpart(B,var[1..-2],'b') mod p:
    c:=Gcd(a,b) mod p:
    
    lcA:=lcoeff(A,var[1..-2]):
    lcB:=lcoeff(B,var[1..-2]):
    g:=Gcd(lcA,lcB) mod p:
    
#   Main loop:
    H:=0: Hold:=0:
    n:=min(degree(A), degree(B)):
    
#    b:=-1:
    b:=1:
    d:=1:
    while (true) do
        
        b:=b+1:
        
        if b=p then return FAIL end if:
        
        gb:=eval(g,xk=b) mod p:
        while (gb=0) do
            b:=b+1:
            gb:=eval(g,xk=b) mod p: 
        end do:
        
printf(" %a=%d\n",xk,b);
        
        Ab:=subs(xk=b,A) mod p:
        Bb:=subs(xk=b,B) mod p:
#        Cb:=badPGCD(Ab,Bb,p,var[1..-2]):
        Cb:=Gcd(Ab,Bb) mod p:
        m:=degree(Cb):
        
printf("    degree(Cb)=%d \n",m);
        
#       Normalize Cb so that lcoeff(Cb)=gb
        lcC:=lcoeff(Cb,var[1..-2]):
        Cb:=(gb/lcC mod p)*Cb mod p:
        
        if m<n then
            Hold:=H: H:=Cb: d:=(xk-b): 
            n:=m:
        elif m=n then
            bi:=(Cb-eval(H,xk=b))/eval(d,xk=b) mod p:
            
            Hold:=H:
            H:=Expand(H+bi*d) mod p:
            
            d:=Expand(d*(xk-b)) mod p:
        end if:
        
        if Expand(Hold-H) mod p=0 and H<>0 then
            C:=Primpart(H,var[1..-2]) mod p:
            if Divide(A,C) mod p and Divide(B,C) mod p then
                return Primpart(c*C) mod p:
            elif m=0
                then return c:
            end if:
        end if:
        
    end do:
    
end proc: