read "PGCD.mpl":

MGCD:=proc(inA,inB,var)
local A,B,a,b,c,lcA,lcB,g,q,h,n,p,P,Ap,Bp,gp,Cp,m,H,Hold,C,invLcCp:
    
    a:=content(inA,var,'A'): b:=content(inB,var,'B'):
    c:=igcd(a,b):
    lcA:=lcoeff(A):
    lcB:=lcoeff(B):
    g:=igcd(lcA,lcB):
    
    n:=min(degree(A,var),degree(B,var)):
printf(" n=%d \n",n);
    
    Hold:=0:
    H:=0:
#    p:=nextprime(10^3);
    p:=5;
    P:=1:
    invLcCp:=1/lcoeff(Cp) mod p:
    
    while true do
        
        p:=nextprime(p):
        
        while g mod p=0 do
            p:=nextprime(p):
        end do:
        
#        if p>30 then return FAIL end if:
        
        Ap:=A mod p:
        Bp:=B mod p:
        gp:=g mod p:
        
        Cp:=PGCD(Ap,Bp,p,var):
        m:=degree(Cp,var):
        
printf(" p=%d     m=%d      n=%d\n",p, m, n);
        
#       Normalize so that gp=lcoeff(Cp)
        Cp:=Expand(gp*invLcCp*Cp) mod p:
        
        if m=0 then return c: end if:
        
        if m<n then
            P:=p:
            H:=Cp:
            n:=m:
        elif m=n then
            Hold:=H:
            H:=mods(chrem([Hold,Cp],[P,p]),P*p):
            P:=P*p:
            
#           check stabalization
            if Expand(H-Hold) mod P=0 then
                C:=primpart(H):
                if divide(A,C) and divide(B,C) then
                    return c*C:
                end if:
            end if:
        end if:
        
    end do:
    
end proc:

