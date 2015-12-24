#/usr/bin/R
l <-c()
A <- matrix(c (1,0,0,0,0,1,1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0),nrow = 5,ncol = 8,byrow= TRUE)
k=0

print("We have the Reseravation Table")
print(A)
for( r in 1:nrow(A))
{
	
	i = 1
	j = ncol(A)
while(i < j)

{
	repeat{
	if(A[r,i] == 1)
	break
	else
	i = i+1
	}
	if(A[r,j]==1)
	{
		k = k+1
		l[k]<-(j-i)
		#print(j-i)
	}
	j = j-1
}

	
}

print("Forbidden latency for the given Reservation table")
unique(l)
