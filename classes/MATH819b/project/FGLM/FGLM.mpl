FGLM:=proc(G,ord)
local LTin, Reduce, LTlex, x, B, Bred, Glex, adj, COUNT, xBar, cs, g, LTg:
    
    LTin:=f->`*`(Groebner[LeadingTerm](f,ord)):
    Reduce:=f->Groebner[NormalForm](f,G,ord):
    
    LTlex:=f->`*`(Groebner[LeadingTerm](f,plex(op(var)))):
    
    x:=1:
    B:=[]:
    Bred:=[]:
    Glex:=[]:
    adj:=table():
    
    for COUNT from 0 while true do
        xBar:=Reduce(x):
        
        cs:=LinComb(xBar,Bred):
        
        if cs=FAIL then
            B:=[ op(B), x ]:
            
            Bred,adj[ nops(Bred) ]:=AddB(Bred,xBar):
            x:=NextMon(x,Glex):
            
        else
            
            cs:=Adjust(cs,adj):
            g:= expand( x - `+`( op(zip(`*`, cs, B))) );
            Glex:=[ op(Glex), g ]:
            LTg:=LTlex(g):
            
            if (type(LTg,`^`) or type(LTg,symbol)) and divide(LTg,var[1]) then
                    Glex:=map(primpart,Glex):
                    return Glex:
            end if:
            
            x:=NextMon(x,Glex):
            
        end if:
        
    end do:
    
end proc: