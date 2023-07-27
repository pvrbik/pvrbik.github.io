DIVIDE:=proc(A,B,var,Q) local R,x,q:

    if (B=0) then return "error"; end if:
    
    if nops(var)=0 then
        if nargs>3 then Q:=A/B: end if:
        return true;
    end if:
    
    R:=A: x:=var[1]: q:=0:
    
    while degree(R,x) >= degree(B,x) do
        if DIVIDE(lcoeff(R,x), lcoeff(B,x), var[2..-1], 't') then
            q:=q+t*x^(degree(R,x)-degree(B,x)):
            R:=R-expand(t*x^(degree(R,x)-degree(B,x))*B):
        else return false:
        end if:
    end do:
    
    if R=0 then
        if nargs>3 then Q:=q: end if:
        return true:
    else return false:
    end if: 
    
end proc:

g:=(x+y);
f:=g^2:
A:=expand( f ):
B:=expand( g ):
DIVIDE(A,B,[x,y],'Q');  Q;
divide(A,B,'Q'); Q;
