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