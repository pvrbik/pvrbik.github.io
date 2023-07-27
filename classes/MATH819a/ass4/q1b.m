A:=58*x^4-415*x^3-111*x+213;
B:=69*x^3-112*x^2+413*x+113;

n:=resultant(A,B,x);

ifactor(n);

for i in [2,3,7,7039,196648119467] do
    print(Gcd(A,B) mod i);
end;
#these gcd's should be 1 (in Z[x]).

quit;