interface(quiet=true):

tragRoth:=proc(F) local C, D, Dp, R, alphas, vi:
    alias(D=DD):
    
    C:=numer(F);
    D:=denom(F);
    Dp:=diff(D,x);
    
    R:=z->resultant(C-z*Dp, D,x);
    
    alphas:=[op({solve(R(z)=0, z)})];
    
    vi:=a->gcd(C-a*Dp,D);
    
    return add( alphas[i]*ln(vi(alphas[i])), i=1..nops(alphas) );
    
end proc:

#trace(tragRoth);
ans:=tragRoth(1/(x^3+x) );

simplify(diff(ans,x));

quit;