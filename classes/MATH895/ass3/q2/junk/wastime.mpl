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
local X,Y,Bnd,Axy,Bxy,betas,b,V,subVar,gx,g,Ax,Bx,t,AA,bb,cc:
    
    X:=var[1]:
    Y:=var[2]:
    
    Bnd:=max(op(map(nops,map( x->Gf[x], Ind)))):
    
    Axy:=A: Bxy:=B:
    
    betas:=table(): b:=1:
    
    for V in var[3..-1] do
        betas[V]:=b:
        b:=b+1:
    end do:
    
    for V in var[3..-1] do
        b:=betas[V]:
        Axy:=eval(Axy,V=b):
        Bxy:=eval(Bxy,V=b):
    end do:
    
    subVar:=seq(V=betas[V],V in var[3..-1]):
    
    gx:=table(): g:=0:
    Ax:=eval(Axy,Y=1): Bx:=eval(Bxy,Y=1):
    gx[1]:=Gcd(Ax,Bx) mod p:
    
    for t in Ind do
#   work on single term
        print("DOING THIS ONE",t);
        AA:=NULL: bb:=NULL: b:=1:
        
        if type(Gf[t],numeric) then
            g:=g+t*myCoeff(gx[1],t):
        else
            
            while nops({AA})<nops(Gf[t]) do
                AA:=AA,subs(Y=b,subVar,Gf[t]):
                
                if type(gx[b],indexed) then
                    Ax:=eval(Axy,Y=b): Bx:=eval(Bxy,Y=b):
                    gx[b]:=Gcd(Ax,Bx) mod p:
                end if:
                
                bb:=bb,[myCoeff(gx[b],t)]:
                
                b:=b+1:
            end do:
            
            AA:=Matrix([op({AA})]) mod p:
            bb:=Matrix([bb]) mod p:
            
            cc:=LinearAlgebra[LinearSolve](AA,bb) mod p:
            g:=g+(Matrix(Gf[t]).cc)[1,1]*t:
            
        end if:
        
    end do:
    
end proc: