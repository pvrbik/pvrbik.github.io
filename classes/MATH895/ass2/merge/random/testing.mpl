interface(quiet=true):
read "../SDMP.mpl":
read "merge_division.mpl":

testOne:=proc(T)
local var,f,g,h,F,G,H,st,R,Q,t,q,r:
    var:=[x,y]:
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
    print("division");
    
    Q[-1]; nops(Q); nops(G);
    
    divide(h,f,'q1'): q1:
    q:=SMP2Maple(Q,var):
    r:=SMP2Maple(R,var);
    return t,evalb(Q=G),expand(q1-q), expand(q-g);
    
end proc:

N:=0:
M:=0:
testOne(100);

quit;

var:=[u,v,x,y,z]:
#var:=[x,y];
f:=randpoly(var,degree=10,terms=100):
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
expand(q1-q);
expand(q-f);

printf("\n");
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
expand(q1-q);
expand(q-g);

quit();
printf("\n\n\n");
divide(h,g,'q1'): q1:
q:=SMP2Maple(Q,var):
r:=SMP2Maple(R,var);
expand(q1-q);
expand(q-f);