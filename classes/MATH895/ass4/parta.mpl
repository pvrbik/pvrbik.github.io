#interface(quiet=true):
read "wang.mpl":
read "mqrr.mpl":

#parti
m:=23;
M:=floor(sqrt(m/2.0));
T:=1000*ilog2(m);
[seq(Wang(u,m,M,M),u=0..m-1)];
[seq(iratrecon(u,m,M,M),u=0..m-1)];

#partii
p1:=2^31-1; p2 := prevprime(p1); m := p1*p2;U:=[2/12345678901, 12345678901/2, 123456/78901] mod m;Digits:=20; M:=floor(sqrt(m/2));[seq( Wang(u,m,M,M), u=U )];T:=1000*ilog2(m);[seq( MQRR(u,m,T), u=U )];
