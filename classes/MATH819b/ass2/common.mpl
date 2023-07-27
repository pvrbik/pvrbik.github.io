GenExp:=proc(deg::nonnegint,numvars::posint)
local X,i,Ts,t,k:
    
    if numvars=1 then return [[deg]]; end if;
    X := []:
    
    for i from 0 to deg do
        Ts:=GenExp(deg-i,numvars-1);
        for t in Ts do
            k:=[i,seq(t[j],j=1..nops(t))];
            X:=[k,op(X)];
        end do:
    end do:
    
    return X:
    
end proc:

MkPoly:=(L,var)->map( x-> `*`(op(zip(`^`,var, x))), L):

AllPoly:=proc(degree::nonnegint, var)
# gives all polynomails from deegree=0 to degree in VAR
    return [seq( op( GenExp(i, nops(var))) , i=0..degree)]:
end proc:

grlex:=proc(s,t)
#output TRUE if s<t
local degS, degT, i:
    
    degS:=`+`(op(s)):
    degT:=`+`(op(t)):
    
    if degS=degT then
        
        for i from 1 to nops(s) do 
            if s[1]>t[1] then
                return false:
            end if:
        end do:
        
        return true:
        
    elif degS>degT then
        return false:
    else
        return true:
    end if:
    
end proc:

grevlex:=proc(s,t)
#output TRUE if s<t
local degS, degT, i, w:
    
    degS:=`+`(op(s)):
    degT:=`+`(op(t)):
    
    if degS=degT then
        w:=s-t:
        for i from nops(s) to 1 by -1 do 
            if w[i]<0 then
                return false:
            elif w[i]<>0 then
                return true:
            end if:
        end do:
        return false:
    elif degS>degT then
        return false:
    else
        return true:
    end if:
    
end proc:
