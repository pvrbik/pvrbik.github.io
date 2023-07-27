terms:=proc(f,var)
local t:
    coeffs(f,var,'t'):
    return [t]:
end proc:

AssForm:=proc(f,var)
#we consider the GCD form as a polynomial in Z[X]
local cnt, Cs, Ind, A, i, X:
    
    X:=var[1]:
    
    Cs:=[coeffs(f,X,'Ind')]; 
    Ind:=[Ind]:
    A:=table():
    
    for i from 1 to nops(Cs) do
        
        if not( type(Cs[i],numeric) ) then
            A[Ind[i]]:=terms(Cs[i], var[2..-1]):
        else
            A[Ind[i]]:=Cs[i]:
        end if:
        
    end do:
    
    return A,Ind;
    
end proc:

myCoeff:=proc(f,t)
    
    if t=1 then 
        return tcoeff(f);
    elif type(t,`^`) then
        return coeff(f,t);
    else
        return foldl( coeff, f, op(t)):
    end if:
    
end proc:

sprInterp:=proc(A,B,Gf,Ind,p,var)
local X,sbVar, g, t, AA, bb, sb, Ax, Bx, gx, cc,degGf,Rnk,tRnk:
global count:
    
    if nops(var)=1 then
        return Gcd(A,B) mod p:
    end if:
    
    X:=var[1]:
    sbVar:=x->seq(V=rand(p)(), V in var[2..-1]):
    degGf:=max(op(map(degree,Ind)));
    
    g:=0:
    
#   find coefficient term by term
    for t in Ind do
        
        AA:=NULL: bb:=NULL:
        
        if type(Gf[t], numeric) then
            
            while (true) do
                sb:=sbVar():
                Ax:=subs(sb,A): Bx:=subs(sb,B):
                gx:=Gcd(Ax,Bx) mod p:
count:=count+1:
                if (degree(gx,X)=degGf) then
                    break:
                end if:
            end do:
            
            g:=g+t*myCoeff(gx,t):
        else
            
            while (nops({AA})<=nops(Gf[t])) do
                
                sb:=sbVar():
                Ax:=subs(sb,A) mod p: Bx:=subs(sb,B) mod p:
                gx:=Gcd(Ax,Bx) mod p:
count:=count+1:
#               test for bad Gf
                coeffs(gx,X,'gxInd'):
                
                if nops(Ind)<nops([gxInd]) then
                    return false:
                end if:
                
                AA:=AA,subs(sb,Gf[t]) mod p:
                bb:=bb,myCoeff(gx,t) mod p:
                
                if nops([bb])>2 and (nops({AA})=nops({AA[1..-2]})) then
                    AA:=AA[1..-2]:
                    bb:=bb[1..-2]:
                end if:
                
            end do:
            
            AA:=Matrix([AA]) mod p:
            bb:=vector([bb]);
            
            cc:=Linsolve(AA,bb,'rank') mod p:
            
#           test for dependent system
            if rank<nops(Gf[t]) then
                return false:
            end if:
            
            cc:=Matrix(cc);
            
            g:=g+(Matrix(Gf[t]).cc)[1,1]*t:
            
        end if:
        
    end do:
    
    return g mod p:
    
end proc: