p:=14747: q:=101: alpha:=4789: beta:=3430:

a:=1:

while (beta <> alpha &^ a mod p) do 
	a:=a+1:
end do:

a;

#SIGNATURE
k:=11:
h:=z->2^z mod p:

alpha &^k mod p;

mygamma:=h(12346182);
mydelta:=k+a*mygamma mod q;

#VERIFICATION
alpha &^ mydelta * beta^(-mygamma) mod p; 

evalb(h(12346182) = mygamma);



quit();
