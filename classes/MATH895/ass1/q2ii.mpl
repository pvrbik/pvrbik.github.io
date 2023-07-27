#interface(quiet=true):

read "ffts.mpl":

PNROU:=proc(n,p) local a,b,qs,t;
    
    `mod`:=mods:
    
    if (p-1 mod n <> 0) then
        error "n must divide p-1":
    end if:
    
    qs:=select(isprime,numtheory[divisors](p-1)):
    
    t:=(a,q)->evalb(a &^ ((p-1)/q) mod p <> 1):
    
    b:=false:
    a:=1;
    
    while(not(b)) do
        a:=a+1;
        b:=foldr(`and`,true,op(map(x->t(a,x),qs)));
    end do:
    
    return a&^((p-1)/n) mod p;
    
end proc:

mkNum:=proc(L,B) local i, ans, Bi:
    
    ans:=0:
    Bi:=1:
    
    for i from 1 to nops(L) do
        ans:=ans+L[i]*Bi:
        Bi:=Bi*B:
    end do:
    
    return ans:
    
end proc:

padzero:=proc(L,N)
    return [op(L),0$(N-nops(L))]:
end proc:

fftMult:=proc(ina,inb,p) local m,n,a,b,N,A,B,C,c,w:
    
    a:=ina;
    b:=inb;
    
    m:=nops(a);
    n:=nops(b);
    
    N:=2:
    
    while (N<m+n) do
        N:=N*2:
    end do:
    
    a:=padzero(a,N):
    b:=padzero(b,N):
    
    w:=PNROU(N,p):
    
    A:=myFFT(N,w,a,p):
    B:=myFFT(N,w,b,p):
    C:=zip(`*`,A,B):
    
    c:=myInvFFT(N,1/w mod p,C,p):
    c:=padzero(c,N):
    
    return c:
    
end proc:

fftIntMult:=proc(inA,inB,B,p) local a,b,c:
    
    a:=convert(inA,base,B):
    b:=convert(inB,base,B):
    
    c:=fftMult(a,b,p):
    
    return c:
    
end proc:

B:=2^32:
p1:=2^27*15+1:
p2:=2^27*17+1:
p3:=2^27*24+1:

r:=rand(2^(10^6)):
a:=r():
b:=r():
c1:=fftIntMult(a,b,B,p1):
c2:=fftIntMult(a,b,B,p2):
c3:=fftIntMult(a,b,B,p3):

nops(c1); nops(c2); nops(c3);

#save a,b,c1,c2,c3, "values.m";
#read "values.m";

c:=[seq(chrem( [c1[i], c2[i], c3[i]], [p1,p2,p3] ), i=1..nops(c1)) ]:

expand(mkNum(c,B)-a*b);

quit:
