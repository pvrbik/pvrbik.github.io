h_square_free:=proc(inA) local a,abar, h, f1, g:
    
    a:=inA:
    
    if degree(a,x)=1 then
        return a:
    end if:
    
    g:=gcd(a,diff(a,x)):
    
    if (g=1) then
#    if (degree(g,x)<1) then 
        return a: 
    end if:
    
    abar:= simplify(a/g):
    h:=gcd(g,abar):
    f1:=simplify(abar/h):
    
    return expand(f1), h_square_free(g):

end proc:

square_free:=proc(inf) local A, S,f,t:
    
    f:=primpart(inf,x,'cc');
    A:=[h_square_free(f)]:
    S:=[seq(i,i=1..nops(A))]:
    t:=(zip( (x,y)->x^y, A, S));
    t[1]:=t[1]*cc;
    return op(t);
    
end proc:
