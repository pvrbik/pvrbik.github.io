
#The project
q:=3:
p:=t^3+2*t+1:
p:=Nextprime(p,t) mod q;

Phi2:=x-> Rem(x,p,t) mod q:

u:=(t^3-t)*x^5-t^11*x^3+t^7*x+t^9+1:
w:=t*x^5-t^6*x^2+1:

a:=u*w:

u0:=Phi2(u,p,q):
w0:=Phi2(w,p,q):

fgcd(u0,w0,p,q);

ck1:=Phi2(u0*w0);
ck2:=Phi2(a);

Expand(ck1-ck2) mod q;

(ut,wt):=UHLA(a,q,p,u0,w0,100);

Expand(a-ut*wt) mod q;

quit;

#A smaller example
q:=3;
p:=t^2+1:
a:=collect(Expand( (t*x^2+t^2*x+1)*((t+1)*x-t^3)) mod q, x):
u0:=t*x^2+t^2*x+1:
w0:=(t+1)*x-t^3:

(u,w):=UHLA(a,q,p,u0,w0,10);

Expand(a-u*w) mod q;

quit:
