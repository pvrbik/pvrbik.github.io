elim:=proc(f,g,varX,varY)
#output TRUE if f<g
local X,Y, LTX,LTY,fy,fx,gy,gx,dfx,dgx:
    
    LTX:=f->Groebner[LeadingTerm](f,tdeg(op(varX))):
    
    fy,fx:=LTX(f);
    gy,gx:=LTX(g);
    
    if fx = gx then
        
        return Groebner[TestOrder](fy,gy, tdeg(op(varY))):
        
    else
        
        return Groebner[TestOrder](fx,gx, tdeg(op(varX))):
        
    end if:
    
end proc:


LTelim:=proc(f::polynom, varX, varY)
local g,t:
    if not type(f,`+`) then return f: end if:
    g:=[seq(t, t in f)]:
    g:=sort(g,(F,G)->elim(F,G,varX,varY))[-1]:
    return g:
end proc:
