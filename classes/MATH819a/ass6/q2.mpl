#interface(quiet=true):

hermite:=proc(f) local prod, P, Q, q, k, qk, T, qkp, L:
    
    read "sqrfree.mpl":
    prod:=x->mul(x[i],i=1..nops(x)):
    
    P:=numer(f):
    Q:=denom(f):
    
    q:=[]:
    q:=[square_free(Q)];
    
    k:=nops(q);
    
    if (f=0) then
        return 0;
    elif (k=1) then
        return `INT`(f,x);
    end if:
    
    L:=q[-1]:
    if op(0,L)=`*` then
        qk:=mul( op([i,1],L) , i=1..nops(L)):
    elif op(0,L)=`^` then
        qk:=op(1,q[-1]);
    else
        qk:=q[-1];
    end if;
    
    T:=prod(q[1..-2]);
    qkp:=diff(qk,x);
    
    gcdex(T*qkp,qk,P,x, 'sigma', 'tau' );
    
    return sigma/(1-k)/qk^(k-1)+hermite( (tau-diff(sigma,x)/(1-k)*T)/T/qk^(k-1) );
    
end proc:

tragRoth:=proc(F) local C, D, Dp, R, alphas, vi, ans, i, v:
    alias(D=DD):
    
    C:=numer(F);
    D:=denom(F);
    Dp:=diff(D,x);
    
    R:=z->primpart(resultant(C-z*Dp, D,x));
    R(z):=factor(R(z));
    
    alphas:=[op({solve(R(z)=0, z)})];
    
    vi:=a->(gcd(C-a*Dp,D));
    
    ans:=0:
    for i from 1 to nops(alphas) do
        v:=vi(alphas[i]):
        v:=v / lcoeff(v,x):
        ans:=ans+alphas[i]*ln(v):
    end do:
    
    return ans:
    
end proc:

#- - - function 1  - - -
f1:= (3*x^5-2*x^4-x^3+2*x^2-2*x+2) / (x^6-x^5+x^4-x^3);
intRat:=hermite(f1);

logpart:=op([2,1],intRat);
intLogPart:=tragRoth(logpart);
integral:=op(1,intRat)+intLogPart;
check:=simplify(diff(integral,x)-f1);

#- - - function 2  - - -
a:=4*x^7-16*x^6+28*x^5-351*x^3+588*x^2-738;
b:=2*x^7-8*x^6+14*x^5-40*x^4+82*x^3-76*x^2+120*x-144;
r:=rem(a,b,x,'q'); 
#We will have to remember to add the integral of q=2 which is 2*x
q;
f2:=r/b;
H:=hermite(f2);
integral:=2*x+H;
check:=simplify(diff(integral,x)-a/b);

#- - - function 3  - - -
f3:=(6*x^5-4*x^4-32*x^3+12*x^2+34*x-24)/(x^6-8*x^4+17*x^2-8);
hermite(f3);
IntLogPart:=simplify(tragRoth(f3));
H:=diff(IntLogPart,x):
H:=simplify(expand(H)):
check:=simplify(factor(simplify(numer(H))/expand(denom(H)))-f3);

quit;

