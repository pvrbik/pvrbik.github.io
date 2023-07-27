myCoeff:=proc(f,t)
    
    if t=1 then 
        return tcoeff(f);
    elif type(t,`^`) then
        return coeff(f,t);
    else
        return foldl( coeff, f, op(t)):
    end if:
    
end proc:

Mgcd:=proc(A,B,p,var)
local g,lc:
    g:=Gcd(A,B) mod p:
    lc:=lcoeff(g,var):
    
    return 1/lc*g mod p:
    
end proc:

sprInterp:=proc(A,B,Gf,Ind,p,var)
local Bnd,X,Y,AA,bb,betas,gs,b,gb,g,t,cc:
    
    X:=var[1..-3]:
    Y:=var[-2]:
    
    Bnd:=max(op(map(nops,map( x->Gf[x], Ind)))):
    
    betas:=[seq(i,i=1..Bnd)]:
    
    gs:=NULL:
    for b in betas do
#       recursive testing this needs to be replaced
        gb:=Mgcd(eval(A,Y=b),eval(B,Y=b),p,X):
        gb:=collect(gb,X, distributed):
        
#       check for bad gf
        if nops([coeffs(gb,X)])>nops(Ind) then
#           Interpolation failed due to bad Gf.
            return false:
        end if:
        
        gs:=gs,gb:
    end do:
    
    gs:=[gs]:
    
    g:=0:
    for t in Ind do
        
        AA:=NULL: bb:=NULL:
        
        if type(Gf[t], numeric) then
            g:=g+t*myCoeff(gs[1],t):
        else
            
            AA:=seq(eval(Gf[t],Y=betas[i]),i=1..nops(Gf[t])):
            AA:=Matrix([AA]) mod p:
            
            bb:=seq([myCoeff(gs[i],t)],i=1..nops(Gf[t])):
            bb:=Matrix([bb]) mod p:
            
            cc:=LinearAlgebra[LinearSolve](AA,bb) mod p:
            
            g:=g+(Matrix(Gf[t]).cc)[1,1]*t:
            
        end if:
        
    end do:
    
end proc:
