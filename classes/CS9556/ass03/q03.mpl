#interface(quiet=true):

myRatRecon:=proc(G,x)
local Uo, Vo, Ao, Up, Vp, Ap, i, Q;
    
    Uo:=1;  Vo:=0;  Ao:=x^(degree(G,x)+1);
    Up:=0;  Vp:=1;  Ap:=G;
    
    for i from 1 while Ap<>0 do
        Q:=expand( quo( Ao,Ap,x ) );
        Ao, Ap:=Ap, expand( Ao-Q*Ap );
        Uo, Up:=Up, expand( Uo-Q*Up );
        Vo, Vp:=Vp, expand( Vo-Q*Vp );
    end do;
    
    return simplify(Ao/Vo);
    
end proc:

#f:=1+2*x+3*x^2;
f:=add( (i+1)*x^i, i=0..9);
latex(f);



myRatRecon(f,x);

#rem( expand(f*g), x^(degree(f,x)+1), x);

quit: