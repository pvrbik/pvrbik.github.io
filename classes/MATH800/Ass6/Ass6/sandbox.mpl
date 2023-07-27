restart();

p:=28703; alpha:=5; beta:=11339; 
x0:=12000; x1:=24567; 
gamma0:=26530; gamma1:=3081;
delta0:=19862; delta1:=7604;

msolve( {(k+2)*delta1=x1-a*gamma1, k*delta0=x0-a*gamma0}, p-1);

a:= (delta1*x0 + 2 * delta0 * delta1 - delta0*x1) / (gamma0*delta1-gamma1*delta0) mod (p-1);

quit();
