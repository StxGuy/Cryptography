# Lester S. Hill (1929)

using LinearAlgebra

key = [ 6   24  1;
       13   16  10;
       20   17  15]

d = trunc(Int,round(det(key)))
key_inv = inv(key)*det(key)
dekey = mod.(invmod(d,26)*key_inv,26)

input = ['A'-'A';
         'C'-'A';
         'T'-'A']

encrypted = mod.(key*input,26)
decrypted = trunc.(Int,mod.(round.(dekey*encrypted),26))

println("Encrypted message:")
for x in encrypted
    println('A'+x)
end

println("Decrypted message:")
for x in decrypted
    println('A'+x)
end

    

