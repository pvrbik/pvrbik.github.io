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

myInvFFT:=proc(N,winv,b,p) local T,Ninv:
    T:=myFFT(N,winv,b,p);
    Ninv:=1/N mod p:
    map(x-> Ninv*x mod p, T);
end proc:

padzero:=proc(L,N)
    return [op(L),0$(N-nops(L))]:
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
