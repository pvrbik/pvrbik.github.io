LTlex:=proc(f::polynom) 
local c,m:
    c:=lcoeff(f,var,`m`):
    return c*m:
end proc:

LTgrlex:=proc(f::polynom)
local d,g,t:
    if not type(f,`+`) then return f: end if:
    d:=max(seq(degree(t),t=f)):
    g:=add(`if`(degree(t)=d,t,0),t=f):
    return LTlex(g):
end proc:

grevlex:=proc(inS,inT)
#output TRUE if s<t
local degS, degT, i, w, s, t:
    
    s:=MultiDeg(inS):
    t:=MultiDeg(inT):
    
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

LTgrevlex:=proc(f::polynom)
local g:
    if not type(f,`+`) then return f: end if:
    g:=[seq(t, t in f)]:
    g:=sort(g,grevlex)[-1]:
    return g:
end proc:

MultiDeg:=proc(f::polynom)
    return [seq( degree(f,t), t in var)]:
end proc:

Division:=proc(inF::polynom,gs::list,LT::procedure)
local g,f,i,qs,r,LTf,LTg:
    
    f:=inF:
    if g=0 then error "division by zero": end if:
    
    for i from 1 to nops(gs) do
        qs[i]:=0:
    end do:
    
    r:=0:
    
    while f <> 0 do
#printf(" %a \n",f);
        LTf:=LT(f):
        LTg:=LT(gs[1]):
        
        for i from 1 while not divide(LTf, LTg, 'q') to nops(gs) do
            
            if i+1>nops(gs) then 
                r:=r+LTf:
                f:=expand(f-LTf):
                i:=0:
                break:
             end if:
            
            LTg:=LT(gs[i+1]):
        end do:
        
        if i=0 then next: end if:
        
        qs[i]:=qs[i]+q:
        f:=expand(f-q*gs[i]):
        
    end do:
    
    return [seq(qs[i],i=1..nops(gs)),r]:
    
end proc:
