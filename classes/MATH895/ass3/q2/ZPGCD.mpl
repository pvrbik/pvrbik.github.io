read "SprInterp.mpl":

ZPGCD:=proc(inA,inB,p,var)
local A,B,xk,C,c,lcA,lcB,g,H,Hold,bs,n,Ab,Bb,Cb,Gf,Ind,Rpt,d,b,gb,m,lcC,bi:
#global count:
    A:=inA:
    B:=inB:
    
    xk:=var[-1]:
    
    if nops(var)=1 then
        C:=Gcd(A,B) mod p:
#count:=count+1:
        if degree(C)=0 then
            C:=1:
        end if:
        return C:
    end if:
    
    A:=Primpart(A,var[1..-2],'a') mod p:
    B:=Primpart(B,var[1..-2],'b') mod p:
    c:=Gcd(a,b) mod p:
#count:=count+1:
    
    lcA:=lcoeff(A,var[1..-2]):
    lcB:=lcoeff(B,var[1..-2]):
    g:=Gcd(lcA,lcB) mod p:
#count:=count+1:
    
#   Main loop:
    H:=0: Hold:=0: bs:=NULL:
    n:=min(degree(A), degree(B)):
    
    Ab:=subs(xk=b,A) mod p:
    Bb:=subs(xk=b,B) mod p:
    Cb:=ZPGCD(Ab,Bb,p,var[1..-2]):
    Gf,Ind:=AssForm(Cb,var);
    
    Rpt:=table():
    d:=1:
    while (true) do
        
        b:=rand(p)():
        
        gb:=eval(g,xk=b) mod p:
        while (gb=0) or (b in {bs}) do
            b:=rand(p)():
            gb:=eval(g,xk=b) mod p: 
        end do:
        bs:=bs,b:
        
        Ab:=subs(xk=b,A) mod p:
        Bb:=subs(xk=b,B) mod p:
        
        Cb:=sprInterp(Ab,Bb,Gf,Ind,p,var[1..-2]):
        
#       test for bad gf
        if Cb=false then
#           start over and get different assumed form
            return ZPGCD(inA,inB,p,var):
        end if:
        
        m:=degree(Cb):
        
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
            
            d:=d*(xk-b):
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