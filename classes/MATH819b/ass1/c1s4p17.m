#QUESTION 17 supplement

DD:=2*t*(1-t)+sqrt(2)*( (1-t)^2+t^2 );
DD:=factor(DD);

xt:= (sqrt(2)*(1-t)^2+2*t*(1-t));

yt:= (sqrt(2)*t^2 + 2*t*(1-t));

f:=factor(expand( xt^2+yt^2 ));

simplify(f/DD^2);

quit: