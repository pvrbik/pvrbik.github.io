interface(quiet=true):
read "SDMP.mpl":
!clear;
f:=proc()
    
    a:=2;
    b:=3;
    c:=4;
    
    return a+b+c:
    
end proc:

trace(f):
f();

quit;