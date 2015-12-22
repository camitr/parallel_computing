# Shared arrays in multiprcess
da = SharedArray(Float64,(5,5),init = s -> s[localindexes(s)] = rand(length(localindexes(s))))
db = SharedArray(Float64,(5,5),init = s -> s[localindexes(s)] = rand(length(localindexes(s))))
dc = SharedArray(Float64,(5,5));

@everywhere function mymatmul!(n,w,da,db,dc)
           # works only for 4 workers and n divisible by 4
           range = 1+(w-2) * div(n,4) : (w-1) * div(n,4)
           dc[:,range] = da[:,:] * db[:,range]
       end

@time @sync begin
           for w in workers()
               @async remotecall_wait(w, mymatmul!, 5, w, da, db, dc)
           end
       end
# simple single process arrays
sa = rand(5,5)
sb = rand(5,5)
sa = (Float64 5,5)





