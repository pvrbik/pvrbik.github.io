#interface(quiet=true):

m:=10^6-17;

r:=[137613,36692,27537,9155,72,11,6,5,1]:

t:=[1,-7,22,-29,109,-13872,83341,-97213,180554]:

q:=[7,3,1,3,127,6,1,1,5]:

for i from 1 to 9 do
    x:=q[i]*abs(t[i])*r[i]:
    
    print(evalb(m/3 < x and x<=m)):
end do: