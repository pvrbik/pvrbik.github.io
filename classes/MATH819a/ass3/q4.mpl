
a:=(9*y-7)*x+12:
b:=(13*y+23)*x^2+(21*y-11)*x+(11*y-13):

2*maxnorm(a)*maxnorm(b)*min(degree(a)+1,degree(b)+1);
#We will need this many primes to be in excess
23*29*31;

`mod`:=mods;
P:=1:
cpts:=[]:
for p in [23,29,31] do
    
    xpt:=[]:
    for alpha from 0 to degree(a,x)+degree(b,x) do
        
        ai:=Eval(a,x=alpha) mod p:
        bi:=Eval(b,x=alpha) mod p:
        ypt:=[]:
        for beta from 0 to degree(ai,y)+degree(bi,y) do
            ypt:=[ op(ypt),(Eval(ai,y=beta) mod p)*(Eval(bi,y=beta) mod p) ]:
        end do:
        xpt:=[op(xpt), Interp( [seq(i,i=0..degree(ai,y)+degree(bi,y))],ypt,y) mod p]:
        
    end do:
    
    cp:=Interp( [seq(i,i=0..degree(a,x)+degree(b,x))], xpt,x) mod p:
    cpts:=[op(cpts),cp]:
    
end do:

c:=chrem(cpts,[23,29,31]) mod 23*29*31;

collect(c,x) mod 23*29*31;
collect(expand(a*b),x);

quit: