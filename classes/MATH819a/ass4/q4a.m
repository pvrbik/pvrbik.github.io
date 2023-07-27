height:=f->max(seq(abs(coeff(f,x,i)),i=0..degree(f,x))):

interBnd:=proc(A) local dim, degs:
    dim:=op([2,1,2],eval(A)):
    degs:=[(seq(op([3,i,2],map(f->degree(f,x),A)),i=1..dim^2))];
    return foldr((x,y)->x+y,0,op(sort(degs)[-dim..-1]))+1;
end proc:

pBnd:=proc(A) local dim, degs:
    dim:=op([2,1,2],eval(A)):
    degs:=[(seq(op([3,i,2],map(f->height(f),A)),i=1..dim^2))];
    return dim!*2*foldr((x,y)->x*y,1,op(sort(degs)[-dim..-1]));
end proc:

modDet:=proc(inA) local phi,phix,P,myDet,p,pBound,A,interBound,ds,j,d,dp:
    
    phi:=(M,p)->map(f->f mod p, M):
    phix:=(M,a,p)->phi(eval(M,x=a),p):
    
    `mod`:=mods:
    P:=1: p
    myDet:=1:
    p:=100:
    pBound:=pBnd(inA):
    
    while (P<pBound) do
        p:=nextprime(p);
        A:=phi(inA,p):
        
        interBound:=interBnd(A):
        
        ds:=[];
        
        for j from 1 to interBound do
            d:=linalg[det](phix(A,j,p), algnum):
            ds:=[op(ds),d]:
        end do:
        
        dp:=Interp([seq(i,i=1..interBound)],ds,x) mod p:
        
        myDet:=chrem([myDet,dp],[P,p]):
        P:=P*p:
        
    end do:
    
    return myDet mod P:

end proc:

P:=()->randpoly(x,degree=2,dense):
A:=linalg[randmatrix](3,3,entries=P);

modDet(A);

simplify(linalg[det](A));
w
quit;