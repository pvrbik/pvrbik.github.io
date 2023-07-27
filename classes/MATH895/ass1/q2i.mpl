#interface(quiet=true):

h_FFT:=proc(N,w,a,p) local i, A, B, C, b, c:
    `mod`:=mods:
    
    if N=1 then 
        A[1]:=a[1]:
    elif N=2 then
        A[2]:=(a[1]+a[2]) mod p;
        A[1]:=(a[1]+w*a[2]) mod p;
    else
        b:=[seq(a[2*i-1],i=1..N/2)]:
        c:=[seq(a[2*i],i=1..N/2)]:
        
        B:=h_FFT(N/2, w^2 mod p, b, p):
        C:=h_FFT(N/2, w^2 mod p, c, p):
        
        for i from 1 to N/2 do 
            A[i]:=(B[i] + (w&^i mod p) * C[i]) mod p:
            A[N/2+i]:=(B[i] - (w&^i mod p) * C[i]) mod p:
        end do
        
    end if:
    
    return [seq(A[i],i=1..N)]:
    
end proc:

`mod`:=mods;

myFFT:=proc(N,w,a,p) local T:
        T:=h_FFT(N,w,a,p):
        return [T[-1],op(T[1..-2])];
end proc:

myInvFFT:=proc(N,w,b,p) local T:
    T:=myFFT(N,w,b,p);
    map(x-> 1/N*x mod p, T);
end proc:

TimeIt:=proc(d) local w,N,p,a,st,t,f:
    w:=81:
    N:=2^14:
    p:=2^16+1:
    f:=Randpoly(d,x) mod p:
    
    a:=[seq(coeff(f,x,i), i=0..d), 0$(N-d)]:
    
    st:=time();
        myFFT(N,w,a,p):
        t:=time()-st;
    t:=time()-st;
    
    return t;
end proc:

### REQUIRED CHECK FOR TWO ###

p:=7*2^20+1:
f:=Randpoly(50,x) mod p:
a:=[seq(coeff(f,x,i), i=0..50), 0$13]:

isgen:=x->evalb(x&^(2^19*7) mod p <> 1 and x&^(2^20) mod p <> 1):
isgen(2);
isgen(3);
numtheory[order](3,p);

#Since 3 is a generator we have that
w:=3 &^( (p-1)/64 ) mod p;
#is a primitive element of order 64.
numtheory[order](w,p);

b:=myFFT(64,w,a,p);
c:=myInvFFT(64,1/w mod p, b, p);

a-c mod p;

### TIME CHECKING ###

a:=TimeIt(2^11);
b:=TimeIt(2^12);
c:=TimeIt(2^13);

evalf(b/a);
evalf(c/b);
#Since doulbling the size of the input did not correspond to four times the run time we can conclude the complexity is not quadratic. 


a:=a/11;
b:=b/12;
c:=c/13;

evalf(b/a);
evalf(c/b);
#Since these numbers are roughly equal we can conclude that the points a,b and c lie on a line which mean the original data is on n*log(n) as desired.

quit;

### INITIAL EASY TESTING ###
a:=[1,-4,1,3,0,1,5,0];

w:=14;
N:=8;
p:=41;

fpts:=myFFT(N,w,a,p);

winv:=(1/w) mod p;
b:=myInvFFT(N,winv,fpts,p);

quit:



quit;

