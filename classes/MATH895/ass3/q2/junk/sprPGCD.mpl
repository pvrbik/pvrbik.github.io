read "zipp.mpl":
read "SprInterp.mpl":

PGCD:=proc(inA,inB,p,var)
local A,B,xk,C,c,lcA,lcB,g,q,H,n,b,gb,Ab,Bb,Cb,m,lcC,qs,Hs,Hold,d,bi,Gf,Ind:
    
    print(var);
    
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
    qs:=NULL: Hs:=NULL: H:=0: Hold:=0:
    n:=min(degree(A), degree(B)):
    
    b:=rand(p)():
    Ab:=subs(xk=b,A) mod p:
    Bb:=subs(xk=b,B) mod p:
#   recursive testing
#    Cb:=Gcd(Ab,Bb) mod p:
    Cb:=PGCD(Ab,Bb,p,var[1..-2]);
    Gf,Ind:=AssForm(Cb,var);
    
    d:=1:
    while (true) do
        
        b:=rand(p)():
        while b in {qs} do
            b:=rand(p)():
        end do:
        
        gb:=eval(g,xk=b) mod p:
        while (gb=0) do
            b:=b+1:
            gb:=eval(g,xk=b) mod p: 
        end do:
        
        if (b>p) then error "FAIL": end if:
        
        Ab:=subs(xk=b,A) mod p:
        Bb:=subs(xk=b,B) mod p:
        
#        Cb:=sprInterp(Ab,Bb,Gf,Ind,p,var[1..-2]):
        Cb:=Gcd(Ab,Bb) mod p;
        
#       test for bad gf
        if Cb=false then
#           start over and get different assumed form
            return PGCD(inA,inB,p,var):
        end if:
        
        m:=degree(Cb,var[1..-2]):
        
#       Normalize Cb so that lcoeff(Cb)=gb
        lcC:=lcoeff(Cb):
        Cb:=(gb/lcC mod p)*Cb mod p:
        
        if m<n then
            qs:=b: Hs:=Cb: H:=0:
            n:=m:
        elif m=n then
            qs:=qs,b:
            Hs:=Hs,Cb:
            bi:=(Cb-eval(H,xk=b))/eval(d,xk=b) mod p:
            
            Hold:=H:
            H:=Expand(H+bi*d) mod p:
#            H:=Interp([qs],[Hs],xk) mod p:
            
            d:=d*(xk-b):
        end if:
        
        C:=Primpart(H,var[1..-2]) mod p:
        
        if Expand(Hold-H) mod p=0 and H<>0 then
            if Divide(A,C) mod p and Divide(B,C) mod p then
                return Primpart(c*C) mod p:
            elif m=0
                then return c:
            end if:
        end if:
        
    end do:
    
end proc: