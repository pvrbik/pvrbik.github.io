#################
#6.4 Question 11#
#################
with(Groebner):
with(PolynomialIdeals):

ord:=plex(x1,x2,x3,x4,u1,u2,u3) ;

h1:=x2-u3;
h2:=(x1-u1)*u3 - x2*u2;

h3:=x4*x1-x3*u3;
h4:=x4*(u2-u1)-(x3-u1)*u3;

g1:=x1^2 - 2*x1*x3 - 2*x4*x2 + x2^2;
g2:=2*x3*u1 - 2*x3*u2 - 2*x4*u3 - u1^2 + u2^2 + u3^2;

I:=<h1,h2,h3,h4>;
G:=Basis(I, ord ):

factor(G);

#PART A
I1:=<op(G[1..4]),u3,G[6]>:
I2:=<op(G[1..4]),x1-u1-u2,G[6]>:

Gnew:=Basis(Intersect(I1,I2),ord);

evalb(Gnew=G);

#So we have V(I) = V(I1 \int I2) = V(I1) = V(I2) as desired.

#PART B
#Decompose I1 into prime factors (REALLY wish I could just use PrimeDecompostion() );
GI1:=Basis( I1, ord);
factor(GI1);

P1[1]:=Quotient(I1,<-u2+u1>);
P1[2]:=Quotient(I1,<x4>);

IsPrime(P1[1]); IsPrime(P1[2]);

#Check
J1:=Intersect( P1[1], P1[2] ) ; 
GJ1:=Basis(J1,ord);

evalb(GI1=GJ1);


#Decompost I2 into prime factors
GI2:=Basis( I2, ord);
factor(GI2);

P2[1]:=Quotient(I2, <2*x4 - u3> );
P2[2]:=Quotient(I2, <u1> );

IsPrime(P2[1]); IsPrime(P2[2]);

Gtemp:=Basis(P2[2],ord);
factor(Gtemp);

P2[3]:=Quotient(P2[2],<u3>);
P2[2]:=Quotient(P2[2],<-u1-u2+2*x3>);

IsPrime(P2[2]); IsPrime(P2[3]);

#Check
J2:=Intersect(P2[1],P2[2],P2[3]);
GJ2:=Basis(J2,ord);

evalb(GI2=GJ2);

#So we can conclude that we have I = INTERSECTION{P1[1],P1[2],P2[1],P2[2],P2[3]}
#But we should check that none of these ideals are contained in one another

idls:={P1[1],P1[2],P2[1],P2[2],P2[3]}:
pairs:=combinat[choose](idls,2):

for x in pairs do
    if IdealContainment(x[1],x[2]) then
        print(x[1], "is contained in", x[2]);
    elif IdealContainment(x[2],x[1]) then
        print(x[2], "is contained in", x[1]);
    end if;
end do;

#where
P2[2];
#Rembering that I1 C I2 => V(I2) C V(I1) we can get rid of P2[2].
#So the prime decompoistion of V(I) is UNION{P1[1],P1[2],P2[1],P2[3]}

#PART C AND PART D
#Notice that 
Vprime := V( P2[3] );
U1 := V( P1[1] );
U2 := V( P1[2] );
U3 := V( P2[1] );

#We have already shown that each of these ideals are prime so their coresponding varieties must be irreducible.
#Also, we have also shown that none of these ideals are contained in any other ideal so their corresponding varieties cannnot admint containment.

#Therefore we conclude that V(I) = UNION{Vprime, U1, U2, U3}

#PART E
ord:=plex(t,x1,x2,x3,x4,u1,u2,u3) ;
g:=x1^2-2*x1*x3-2*x2*x4+x2^2;

Basis( <P1[1],1-t*g>, ord); 
Basis( <P1[2],1-t*g>, ord); 
Basis( <P2[1],1-t*g>, ord); 
Basis( <P2[3],1-t*g>, ord); 

#So the conclusion is valid on 
P2[3];

#and
P1[2];
#(this is actually the special case where the trapezoid is a square!)

#PART F
#this time I will use the PrimeDecompostion command
h1p:=x1-u1-u2;
h2p:=x2-u3;

h3:=x4*x1-x3*u3;
h4:=x4*(u2-u1) - (x3-u1)*u3;

I:=<h1p,h2p,h3,h4>;
#IsPrime(I);

ord:=plex(x1,x2,x3,x4,u1,u2,u3) ;
G:=Basis(I,ord);

factor(G);

I1:=< u1, G[2..4] >;
I2:=<2*x4 - u3, G[2..4] >;

IsPrime(I1); IsPrime(I2);

G2:=Basis(I2,ord);
factor(G2);

P[1]:=Quotient(I2,<u3>);
P[2]:=Quotient(I2,<-u1 - u2 + 2*x3>);

IsPrime(P[1]); IsPrime(P[2]);

J:=Intersect(P[1],P[2]);
evalb(G2=Basis(J,ord));

#So V is reducible and has 3 components corresponding to I1, P[1], and P[2] above.

quit: