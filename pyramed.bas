#include "string.bi"
function creating(file as string) as integer
	dim img as integer
	img=freefile
	open file for output as img
	print #img,"# OBJ"
	print #img,"# "
	return img
end function

sub closeimg(file as integer)
	print #file,""
	close file
end sub

sub points(x as double, y as double, z as double,img as integer)
	print #img,"v ";
	print #img," "+format(x,"0.00");
	print #img," "+format(y,"0.00");
	print #img," "+format(z,"0.00")
end sub 

sub linking(img as integer)
	print #img,"f 1 2 3"
	print #img,"f 2 1 3"
	print #img,"f 3 1 2"
	print #img,"f 1 2 4"
	print #img,"f 2 1 4"
	print #img,"f 4 1 2"
	print #img,"f 1 3 4"
	print #img,"f 3 1 4"
	print #img,"f 4 1 3"
	print #img,"f 2 3 4"
	print #img,"f 3 2 4"
	print #img,"f 4 2 3"
	
	
end sub 


dim w as double
dim h as integer
dim x as double
dim y as double
dim z as double
dim n as integer
dim image1 as integer
color 15,5

print "W?"
input w
image1=creating("out.obj")
for n=0 to 3
	read x
	read y
	read z
	x=x*w
	y=y*w
	z=z*w
	points x,y,z,image1
next
linking(image1)
closeimg image1
data 0.50,0.00,0.50
data 1.00,1.00,0.00
data 1.00,1.00,1.00
data 0.00,1.00,0.50