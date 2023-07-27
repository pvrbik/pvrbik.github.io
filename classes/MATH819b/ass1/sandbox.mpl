with(plots):
plotsetup(x11):

myPlot:=(f,i,j)->implicitplot(f=0,x=-i..i,y=-j..j, axes=none):
myPlot3d:=(f,i,j,k)->implicitplot3d(f=0,x=-i..i,y=-j..j,z=-k..k,axes=none):

#4a
f1:=x^2+y^2+z^2-1:
p1:=myPlot3d(f1,1,1,1):

#4b
f2:=x^2+y^2-1:
p2:=myPlot3d(f2,1,1,1):

 #4c
#intuitely, three planes should intersect at a point
f3:=[-2,3.2,0]:
p3:=pointplot3d([f3]):

#4d 
f4:=x*z^2-x*y:
p4:=myPlot3d(f4,1,1,1):

#4e
f5:=x*(y*x-z):
p5:=myPlot3d(f5,1/2,1/2,1/2):

#4f
#this is on the =1/2 plane
r:=sqrt(3)/2;
p6:=spacecurve( [ r*cos(t), r*sin(t), 1/2], t=0..2*Pi,axes=box);

T:=array(1..2,1..3):

T[1,1]:=p1:
T[2,1]:=p4:
T[1,2]:=p2:
T[2,2]:=p5:
T[1,3]:=p3:
T[2,3]:=p6: