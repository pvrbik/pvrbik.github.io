interface(quiet=true):
read "../SDMP.mpl":
read "merge_division.mpl":

testOneSlow:=proc(T)
local var,f,g,h,F,G,H,st,R,Q,t,q,r:
    
    var:=[u,v,x,y,z]:
    f:=randpoly(var,degree=10,terms=T):
    g:=randpoly(var,degree=5,terms=5):
    h:=expand(f*g):
    
    F:=Maple2Smp(f,var):
    G:=Maple2Smp(g,var):
    H:=Maple2Smp(h,var):
    
    print("H/G"); 
    st:=time():
    (R,Q):=SMPdiv(H,G,var):
    t:=time()-st;
    
    st:=time():
    evalb((Q[1..-2])=(F));
    t:=time()-st;
    
    Q[-1]; nops(Q); nops(F);
    
    divide(h,g,'q1'): q1:
    q:=SMP2Maple(Q,var):
    r:=SMP2Maple(R,var);
    
    return expand(q1-q), expand(q-f);
end proc:

testOneFast:=proc(T)
local var,f,g,h,F,G,H,st,R,Q,t,q,r:
    var:=[u,v,x,y,z]:
    f:=randpoly(var,degree=10,terms=T):
    g:=randpoly(var,degree=5,terms=5):
    h:=expand(f*g):
    
    F:=Maple2Smp(f,var):
    G:=Maple2Smp(g,var):
    H:=Maple2Smp(h,var):
    
    print("H/F"); 
    st:=time():
    (R,Q):=SMPdiv(H,F,var):
    t:=time()-st;
    
    st:=time():
    evalb((Q[1..-2])=(G));
    t:=time()-st;
    
    Q[-1]; nops(Q); nops(G);
    
    divide(h,f,'q1'): q1:
    q:=SMP2Maple(Q,var):
    r:=SMP2Maple(R,var);
    return expand(q1-q), expand(q-g);
    
end proc:

T:=5000;
print("round one");
testOneFast(T);
testOneSlow(T);

print("round two);
testOneFast(T);
testOneSlow(T);

quit;
