#interface(quiet=true):

INT:=proc(f,x) local n:

    if type(f,numeric) then
        return f*x:
    elif type(f,symbol) and f<>x then
        return f*x:
    elif op(0,f)=`*` then
        if type(op(1,f),`numeric`) then
            return op(1,f)*INT( f/op(1,f),x ):
        elif op([2,0],f)=`exp` then
            return op(1,f)*exp(x) - INT( diff(op(1,f),x)*exp(x),x ):
        elif op([2,0],f)=`ln` then
            n:=op([1,2],f):
            return ln(x)*x^(n+1)/(n+1) - 1/(n+1)^2*x^(n+1):
        else return
            integral(f);
        end if
    elif op(0,f)=`+` then
        return add( INT(op(i,f),x), i=1..nops(f) ):
    elif op(0,f)=`symbol` then 
        return f^2/2:
    elif op(0,f)=`^` then
        if op(2,f)<>(-1) then
            n:=op(2,f):
            return 1/(n+1)*x^(n+1):
        else
            return ln(x):
        end if:
    elif op(0,f)=`exp` then
        return exp(x):
    elif op(0,f)=`ln` then
        return x*ln(x)-x;
    else
        return integral(f);
    end if:

end proc:

INT(x^2+2*x+1,x);

INT(x^2*exp(x) + x^2*ln(x), x);

INT(3/x + 2*x*f(x)*y+x^n , x);
