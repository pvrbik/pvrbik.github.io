CRT:=(As,fs,x,Q)->h_CRT(As,fs,x,Q,mul(fs[i], i=1..nops(fs))):

h_CRT:=proc(As,fs,x,Q,M) local v1,v2,Abar,`&pmod`:
     
     `&pmod`:=(a,b)-> simplify(Rem(a,b,x) mod Q):
     
    if (nops(As)=1) then
        return As[1] &pmod fs[1]:
    end if:
    
    Abar:=CRT(As[1..-2], fs[1..-2],x,Q):
    
    Gcdex(fs[-1],simplify(M/fs[-1]),x,'f1Inv') mod Q:
    v1:=fs[-1]*f1Inv:
    
    Gcdex(simplify(M/fs[-1]),fs[-1],x,'f2Inv') mod Q:
    v2:=M/fs[-1]*f2Inv:
    
    v1:=simplify(v1):
    v2:=simplify(v2):
    
    return (Abar*v1 + As[-1]*v2) &pmod M:

end proc: