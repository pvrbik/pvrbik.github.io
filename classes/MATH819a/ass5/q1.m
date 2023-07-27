#interface(quiet=true):
h_square_free:=proc(inA) local a,abar, h, f1, g:
    
    a:=inA:
    
    if degree(a,x)=1 then
        return a:
    end if:
    
    g:=gcd(a,diff(a,x)):
    
    if (g=1) 
        then return a: 
    end if:
    
    abar:= simplify(a/g):
    h:=gcd(g,abar):
    f1:=simplify(abar/h):
    
    return expand(f1), h_square_free(g):

end proc:

square_free:=proc(f) local A, S:
    
    A:=[h_square_free(f)]:
    S:=[seq(i,i=1..nops(A))]:
    return op(zip( (x,y)->x^y, A, S));
    
end proc:

mapFact:=(L,p)->map( x-> Factor(x) mod p, L);
P:={13,17,19}:

#-  -   -   -This is P1-    -   -   -   -
p1:=x^10-6*x^4+3*x^2+13;
B:=[square_free(p1)];
for p in P do
    print(p,mapFact(B,p));
end do:

# ^ = intersection
# Degree analysis p1 (since it did not decompose)
# Since D13 ^ D17 ^ D19 = {2,4} ^ {5} ^ {4} = {} so p1 is irreducidlbe by degree analysis.

#-  -   -   -This is P2-    -   -   -
p2:=8*x^7+12*x^6+22*x^5+25*x^4+84*x^3+110*x^2+54*x+9;
B:=[square_free(p2)];
for p in P do
    print(p,mapFact(B,p));
end do:

# Degree analysis for the factor x^4+2*x^2+9:
# Since D13 ^ D17 ^ D19 = {2} ^ {1,2} ^ {1,2} = {2} p2 must decompose into two degree 2 factors.

#Trial divisoins
rem(B[1], x^2 + 2*x + 3, x,'q');
#implies that p1 decomposes into
(x^2+2*x+3)*(q);

#-  -   -   -This is P3-    -   -   -   -
`mod`:=mods:
p3:=9*x^7+6*x^6-12*x^5+14*x^4+15*x^3+2*x^2-3*x+14;
B:=[square_free(p3)];
for p in P do
    print(p,mapFact(B,p));
end do:

# Degree analysis for p3 (since it did no decompose)
# Since D13 ^ D17 ^ D19 = {1,2,3} ^ {1.2.3} ^ {3} = {3} so p3 must have at least one factor of degree 3

# Trial division (for the only obvious degre 3 polynomial)
rem(p3, x^3+11*x+15,x,'q');
# Trial divison failed

#Chinese remaindering
# (ignoring scalar coefficients) we are forced to take (x^3 - 8x - 4) mod 19 and (x^2-6x+4)(x+6) mod 13 but there are 6 options for degree 3 polynomials from mod 17.
# considerinng scalar coefficents we now have the option to take a scalar coeffient from {1,-1,3,-3,9,-9} for the mod 19 factor, {1,-1,2,-2,4,-4,8,-8} for the mod 17 factor and {1,-1,2,-2,4,-4} for the mod 13 factor. We check all of these combinations exaustively.

exaust:=proc()
local f19,f13,deg1_f17, deg2_f17,q,c19,c17,c13,a,b,f17,t:
    f19:=x^3-8*x-4;
    f13:=expand((x^2-6*x+4)*(x+6)) mod 13;
    deg1_f17:={x-4, x-5, x+8}:
    deg2_f17:={x^2+5*x-5, x^2+8*x+6}:
    
    q:=evaln(q);
    for c19 in {1,-1,3,-3,9,-9} do
        for c17 in {1,-1,2,-2,4,-4,8,-8} do
            for c13 in {1,-1,2,-2,4,-4} do
                for a in deg1_f17 do
                    for b in deg2_f17 do
                        f17:=expand(a*b) mod 17:
                        t:=chrem([c13*f13,c17*f17,c19*f19],[13,17,19]);
                        if (rem(p3,t,x,'q')=0) then
                            return simplify(t) mod 13*17*19, simplify(q)  mod 13*17*19:
                        end if
                    end do
                end do
            end do
        end do
    end do:
    
end proc:

(a,b):=(exaust());
# But clearly these are off. Luckily I know that the leading term of a must be a 3 since 807 deocomposes into (3)(269) and the leading factor of p3 is a 9. I normalize both factors acordingly. (It comes out this way because rem is done in the rationals NOT the integers as we need it to do).
ifactor(807); ifactor(1920);
-a/269; -b/(2^7*5);
factor(p3);

#-  -   -   -This is P4-    -   -   -   -
P:={17,19,23};
p4:=x^11 + 2*x^10 + 3*x^9 - 10*x^8 - x^7 - 2*x^6 + 16*x^4 + 26*x^3 + 4*x^2 + 51*x -170;
B:=[square_free(p4)];
for p in P do
    print(p,mapFact(B,p));
end do:

factor(p4);

#Clearly using Chinese remainder theory is highly ineffcient since we don't want to CHREM on every product of factors which have particular degree. We instead use Hensel lifting to life the mod 19 factors.

t:=op(mapFact(B,19)):
fct:=[seq(op(i,t),i=1..4)]:

a:=fct[1]*fct[4];
b:=fct[2]*fct[3];
#note I just interchanged the indecies here until UHLA didn't fail.

gcd(a,b) mod 19;
#So indeed our two factors are realitively prime as required.

read "hensel.mpl";
UHLA(p4,19,a,b,170);
#gives the factorization

factor(p4);

quit:
