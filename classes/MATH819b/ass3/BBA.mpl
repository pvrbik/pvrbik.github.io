BBA:=proc(inG,ord)
local G,Gp,i,j,p,q,S:
    
    G:={op(inG)}:
    
    for count from 0 while true do
        Gp:=G:
printf("G%d = %a \n",count,Gp):
        for i from 1 to nops(Gp) do
            for j from i+1 to nops(Gp) do
                p:=Gp[i]: q:=Gp[j]:
                S:=Groebner:-SPolynomial(p,q,ord):
                S:=Groebner:-NormalForm(S,Gp,ord):
                
                if S<>0 then
                    G:=G union {S}:
                end if:
            end do:
        end do:
        
        if G=Gp then return G: end if:
    end do:
    
end proc:
