MGE:=proc(inA,inb,m,k)
local n,A,L,b,p,P,x,badprime,betas,xpbs,beta,Apb,bpb,xpb,xp,i,xx,pass:
    
    n:=LinearAlgebra[Dimension](inb):
    
    #	cleaning up
    A:=map(rem,inA,m,e):
    L:=ilcm(seq(seq(denom(A[i,j]),i=1..n),j=1..n)):
    A:=A*L:
    b:=inb*L:
    
    #	p:=2^30:
    p:=2^60:
    P:=1:	
    x:=Vector(1..n,0):
    
    while true do
    
        p:=nextprime(p):
        
        while not(1 = p mod k) do
            p:=nextprime(p):
        end do:			
        
        printf("p=%d \n", p);
        
        badprime:=false:
        
        betas:=map(x->x[1],Roots(m) mod p):
        
        xpbs:=NULL:	
        
        for beta in betas do
            Apb:=eval(A,e=beta) mod p:
            bpb:=eval(b,e=beta) mod p:
            xpb:=Linsolve(Apb,bpb) mod p:
            
            #a bad prime/eval point is one that makes A go singluar.
            if type(xpb,function) then
                badprime:=true:
                break:
            end if:
            
            xpbs:=xpbs,xpb:
        end do:
        
        if not(badprime) then
            xp:=Vector(1..n,0):
        
            for i from 1 to n do
                xp[i]:=Interp(betas,[seq(v[i],v in xpbs)],e) mod p: 
            end do:
            
            x:=chrem([x,xp],[P,p]):
            P:=P*p:
            
            xx:=Vector(1..n,0):
            pass:=true:
            
            for i from 1 to n do
                xx[i]:=iratrecon(x[i],P):
                
                if xx[i]=FAIL then
                    pass:=false:
                    break:
                end if:
            end do:
            
            if pass and convert(map(rem,A.xx-b,m,e),set)={0} then
                return xx:
            end if:
            
        end if:
        
    end do:
    
end proc:
