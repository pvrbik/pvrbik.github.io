#interface(quiet=true):
read "ffts.mpl":

SchoStrass:=proc(inA,inB,B) local a,b,logB,m,L,beta,r,p,N,w,A,c,winv,sqrtm:
    
    a:=inA:
    b:=inB:
    
    logB:=x->nops(convert(x,base,B)):
    
    m:=max(logB(a),logB(b));
    
    L:=1:
    
    sqrtm:=evalf(sqrt(m)):
    while not(2^(L-1)<=sqrtm and sqrtm<2^L) do
        L:=L+1:
    end do:
    
    beta:=B^(ceil(m/2^L)):
    
    r:=1:
    p:=0:
    while not(p>2^L*beta^2) do
        r:=r+1:
        p:=2^(2^r)+1:
    end do:
    
    N:=2^(L+1):
    w:=2^( (2^(r+1))/N ) mod p:
    
    a:=convert(a,base,beta):
    a:=padzero(a,N):
    
    b:=convert(b,base,beta):
    b:=padzero(b,N):
    
    a:=myFFT(N,w,a,p):
    b:=myFFT(N,w,b,p):
    
    c:=zip(`*`,a,b):
    c:=padzero(c,N):
    
    winv:=-iquo(p,w);
    
    c:=myInvFFT(N,winv,c,p):
    
    return [c,beta];
    
end proc:

#read "values.m":

B:=2^32:

r:=rand(2^(10^6)):
a:=r():
b:=r():

ANS:=SchoStrass(a,b,B):
c:=ANS[1]:
beta:=ANS[2]:

expand(mkNum(c,beta)-a*b);

quit:
