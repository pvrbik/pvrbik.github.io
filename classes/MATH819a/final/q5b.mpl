####Question 5(B-C)###
####PAUL VRBIK###
####301056796 ###

liftRoot:=proc(A,alpha0,p) local Phi, alpha, apu, pk, k, e, alphaK:
    
    `mod`:=mods:
    Phi:=x->x mod p:
    
    alpha:=alpha0;
    
    apu:= Phi(1/ eval(diff(A,x),x=alpha0)):
    
    pk:=p:
    
    bound:=tcoeff(A,x);
    
    for k do
        e:=eval(A,x=alpha):
        
        if e=0 then
            return(alpha):
        end if:
        
        if abs(alpha)>abs(bound) then
            return "Not a root in integer field":
        end if:
        
        alphaK:= -Phi(iquo(eval(A,x=alpha), pk, 'rr')*apu );
        alpha:=alpha+alphaK*pk;
        pk:=p*pk;
    end do:
    
end proc:

p:=11;
A:=x^5-246*x^4+321*x^2-39452*x+15129*x^3-3813;

liftRoot(A,-9,p);
liftRoot(A,-4,p);
check:=factor(A);

quit;
