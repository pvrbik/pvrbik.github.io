zipMult:=(A,B)->zip((x,y)->x*y,A,B):
listAdd:=A->foldr((x,y)->x+y,0,op(A)):

h_primPow:=proc(p,alpha,ans)
        if (alpha mod p = 0) then
                return h_primPow(p,alpha/p,ans+1):
        else
                return ans:
        end if:
end proc:

primPow:=(p,a)->h_primPow(p,a,0):

myFactor:=proc(inalpha,B::list) local i,x,listx,alpha:
        alpha:=inalpha:
        x[1]:=primPow(B[1],alpha):
        alpha:=alpha/(B[1]^x[1]):
        for i from 2 to nops(B) do
                x[i]:=primPow(B[i],alpha):
                alpha:=alpha/(B[i]^x[i]):
        end do:

        listx:=[seq(x[i],i=1..nops(B))]:

# if myFactor can't factor alpha in the base it will return NULL
        if(foldr((x,y)->x*y,1,op(zip((x,y)->x^y,B,listx)))=inalpha) then;
                return listx:
        else return NULL:
        end if:
end proc:

makeFun:=(var,coef)->listAdd(zipMult(var,coef)):

indexCalc:=proc(alpha,beta,p,sizeB) local B,i, temp, congEqns,mytry,var,back,n,x,logOf,listlogOf:
# solve log[alpha] beta mod p
    B:=[seq(ithprime(i),i=1..sizeB)]:

    var:=[seq(a[i],i=1..nops(B))]:

    for i from 1 to nops(B) do back[var[i]]:=B[i]: end do:

    congEqns:={}:

    n:=1:
    while (n<=10) do
        x:=rand(1..p)():
        temp:=myFactor(alpha^x mod p,B):
        if (temp <> NULL) then
            congEqns:={makeFun(var,temp)=x} union congEqns:
            n:=n+1:
        end if:
    end do:

    temp:=msolve(congEqns,p-1);

    logOf:=table();

    for i from 1 to nops(B) do
        logOf[back[lhs(temp[i])]]:=rhs(temp[i]):
    end do:

    listlogOf:= [seq(logOf[B[i]],i=1..nops(B))]:
    listlogOf;

    while (true) do
        x:=rand(1..p)():
        mytry:=beta*5^x mod p:
        temp:=myFactor(mytry,B);
        if (temp<>NULL) then
            return listAdd(zipMult(temp,listlogOf)) -x mod (p-1):
        end if:
    end do:
end proc:

p:=10007:
alpha:=5:
B:=[2,3,5,7]:
beta:=356:

a:=indexCalc(alpha,beta,p,6); alpha^a mod p = beta;

quit();


