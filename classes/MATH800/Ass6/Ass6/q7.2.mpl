#Part A

verk:=(x,gamma,delta,alpha,beta,p)-> evalb((beta&^gamma * gamma&^delta mod p)=(alpha&^x mod p));

verk(20543,20679,11082,5,26379,31847);

#Part B

print("hi paul");

a:=1:

while (5 &^ a mod 31847 <> 26379) do
	a:=a+1:
end do:

a; 5 &^ a mod 31847;

#Part C

kinv:=(11082 / (20543-7973*20679))/2 mod (31846/2);

k:=(20543-7973*20679)/11082/2 mod (31846/2);

msolve(11082 = (20543-7973*20679)*(1/k), 31846);

k:=3464;;

11082 = (20543-7973*20679) (1/k) mod 31846;

(20679 = 5&^k mod 31847);

k:=1;

while (5&^k mod 31847 <> 20679) do
	k:=k+1:
end do:

k;

quit();
