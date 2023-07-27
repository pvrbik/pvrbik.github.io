####Question 3###
####PAUL VRBIK###
####301056796 ###

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

f:=(2*x^3-x^2+2*x+3)/(x^4-x^3-x+1);
intRat:=hermite(f);

logpart:=op([2,1],intRat);
intLogPart:=tragRoth(logpart);
integral:=op(1,intRat)+intLogPart;

check:=simplify(diff(integral,x)-f);

quit();