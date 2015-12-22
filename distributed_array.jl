
@everywhere using DistributedArrays
a = @DArray [ i+j for i = 1:100 , j = 1:100 ]
b =  [ i+j for i = 1:100 , j = 1:100 ]

#matric multipication
@time @spawn a*a

@time b*b
