zipPow:=(A,B,g,p)->zip((xx,yy)->(Powmod(xx,yy,g,x)mod p),A,B):
zipMult:=(A,B)->zip((x,y)->x*y,A,B):
foldMult:=(A,p)->foldr( (n,m)->funMult(n,m,p), 1, op(A)):
listAdd:=A->foldr((x,y)->x+y,0,op(A)):
funMult:=(f,g,p)->Expand(f*g) mod p;
funDiv:=(f,g,p)->Quo(f,g,x) mod p:
funMod:=(f,g,p)->Rem(f,g,x) mod p:

funcOrd := proc(f,g,p) local i,ft,gt:
    i:=0:
    ft:=f: gt:=g:
    while (true) do
        ft:=funMod(funMult(ft,f,p),g,p):
        i:=i+1:
        if (ft=f) then break: end if:
    end do:
    return i:
end proc:

h_primPow:=proc(f,alpha,p,ans)
	if (Rem(alpha,f,x) mod p = 0) then
		return h_primPow(f,Quo(alpha,f,x) mod p,p,ans+1):
	else
		return ans:
	end if:
end proc:

primPow:=(f,alpha,p)->h_primPow(f,alpha,p,0):

makeB:=proc(n,p) local a,i,temp:
    a[1]:=x:
    i:=2;
    temp:=Nextprime(a[1],x) mod p:
    while (i<=n) do
        if ( coeff(temp,x,degree(temp,x))=1 ) then
            a[i]:=temp:
            i:=i+1;
            temp:=Nextprime(a[i-1],x) mod p:            
        else
            temp:=Nextprime(temp,x) mod p:
        end if:
        
    end do:
    return [seq(a[i],i=1..n)]:
end proc:

myFactor:=proc(inalpha,B,g,p) local alpha, i, a, lista:
    alpha:=inalpha;
    for i from 1 to nops(B) do 
        a[i]:=primPow(B[i],alpha,p);
        alpha:=funDiv(alpha,Powmod(B[i],a[i],g,x) mod p,p):
    end do:
    
  	lista:=[seq(a[i],i=1..nops(B))]:

  	if (foldMult(zipPow(B,lista,g,p),p)=inalpha) then
        return lista:
    else 
        return NULL:
    end if:

end proc:

makeFun:=(var,coef)->listAdd(zipMult(var,coef)):


indexCalc:=proc(alpha,beta,g,p,k,sizeB) local B,i, temp, congEqns,mytry,var,back,n,y,logOf,listlogOf:
# solve log[alpha] beta mod p
    B:=makeB(sizeB,p):
    if(degree(B[sizeB],x)>=k) then return "error factor base too large"; end if;
    print("degree",degree(B[sizeB],x));
    var:=[seq(a[i],i=1..nops(B))]:

    for i from 1 to nops(B) do back[var[i]]:=B[i]: end do:

    congEqns:={}:
    n:=1:
    while (n<=nops(B)+20) do
        y:=rand(1..p^k-1)():
        temp:=myFactor( Powmod(alpha,y,g,x) mod p ,B,g,p):

        if (temp <> NULL) then
            congEqns:={makeFun(var,temp)=y} union congEqns:
            n:=n+1:
            print("n:",n);
        end if:
    end do:

    temp:=msolve(congEqns,p^k-1);
    print("minSolutions",nops(temp));

    while(nops(temp)<nops(B)) do
        n:=1:
        while (n<=10) do
            y:=rand(1..p^k-1)():
            temp:=myFactor( Powmod(alpha,y,g,x) mod p ,B,g,p):
            if (temp <> NULL) then
                congEqns:={makeFun(var,temp)=y} union congEqns:
                n:=n+1:
                print("n:",n);
            end if:
        end do:
        temp:=msolve(congEqns,p^k-1);
        print("minSolutions",nops(temp),nops(congEqns));
    end do;
   

    logOf:=table();

    for i from 1 to nops(B) do 
        logOf[back[lhs(temp[i])]]:=rhs(temp[i]):	
    end do:
    
    listlogOf:= [seq(logOf[B[i]],i=1..nops(B))]:
    
    while (true) do
        y:=rand(1..p^k-1)():
        mytry:=Rem(funMult(beta,Powmod(alpha,y,g,x) mod p,p),g,x) mod p;
        print(mytry);
        temp:=myFactor(mytry,B,g,p);
        if (temp<>NULL) then
            return listAdd(zipMult(temp,listlogOf)) -y mod (p^k-1):
        end if:
    end do:
end proc:

kernelopts(printbytes=false);
p:=2: k:=50: 
beta:=1+x+x^2: 
g:=Nextprime(x^k,x) mod p: 
alpha:=x+1: sizeB:=400:

aa:=indexCalc(alpha,beta,g,p,k,sizeB); Powmod(alpha,aa,g,x) mod p = beta;

quit();
