#interface(quiet=true):

#Part i
T:=table():
T[1]:={x-1}:
all:=T[1]:
for n from 2 to 12 do
    fs:=factor(x^n-1):
    T[n]:={op(fs)} minus all:
    all:=all union T[n]:
end do:

for i from 1 to 12 do
    printf("%d  %a \n", i, sort(op(T[i]))):
end do: 


