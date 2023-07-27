pord:=proc(A,B):
    if (A[1]=B[1]) then 
        return pord(A[2..-1],B[2..-1]):
    end if:
    return evalb(A[1]>B[1]):
end proc:

Maple2Smp:=proc(inF,var) local f,con,n,m;
    f:=expand(inF):
    con:=g->[seq(degree(g,var[i]),i=1..nops(var))]:
    n:=[coeffs(f,[x,y,z],'m')]:
    m:=[m]:
    return sort( [seq([n[i],con(m[i])],i=1..nops(m))], (x,y)->pord(x[2],y[2]) ):
end proc:

SMP2Maple:=(p,var)->add(map(x->x[1]*mul(zip((a,b)->a^b,var,x[2])[i],i=1..nops(var)),p)[i],i=1..nops(p));

SMPadd:=proc(A,B)
    if (A=[]) then
        return B:
    elif (B=[]) then
        return A:
    elif (A[1][2]=B[1][2]) then
        return [ [A[1][1]+B[1][1], A[1][2]], op(SMPadd(A[2..-1],B[2..-1])) ]:
    elif (pord(A[1][2],B[1][2])) then
        return [ A[1], op(SMPadd(A[2..-1],B) )]:
    else
        return [ B[1], op(SMPadd(A,B[2..-1]) )]:
    end if:
end proc:

SMPmult:=proc(A,B,var) local f,g:
    f:=(x0,C)->map(x->[x0[1]*x[1],x0[2]+x[2]],C):
    g:=zip(f,A,[seq(B,i=1..nops(A))]):
    foldr( (x,y)->SMPadd(x,y),Maple2Smp(0,var),op(g) ) 
end proc:

var:=[x,y,z]:
a:=randpoly(var,degree=6,terms=15):
b:=randpoly(var,degree=6,terms=15):
A:=Maple2Smp(a,var):
B:=Maple2Smp(b,var):
C:=SMPadd(A,B):
expand(a+b-SMP2Maple(C,var));
C:=SMPmult(A,B,var):
expand(a*b-SMP2Maple(C,var));


quit():
var:=[x,y,z]:

f:=7*x^2+x^3*y*z+3*x^2*z:
g:=2*f+3*z^4:

f:
fg:=Maple2Smp(f,var):
g:
gg:=Maple2Smp(g,var):

back:=SMPmult(fg,gg,[x,y,z]);

SMP2Maple(back,[x,y,z]);

expand(f*g);

