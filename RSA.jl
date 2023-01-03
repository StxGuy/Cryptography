
# Choose two prime numbers
p = 53
q = 59
println("Private key p = ",p)
println("Private key q = ",q)

n = p*q
println("Public key n = ",n)

# Compute totient
Φ = (p-1)*(q-1)
println("Φ = ",Φ)

# Find k which is coprime with totient
k = 2
while (gcd(k,Φ) ≠ 1 && k ≤ Φ)
    global k += 1
end
println("Public key k = ",k)

# Choose d, such that mod(Φ) = 1
d = 0
for i in 1:10
    x = 1 + i*Φ
    if (x%k == 0)
        global d = Int(x/k)
        break
    end
end
println("Private key d = ",d)

# Encryption
s = 'H'
m = Int(s-'0')
c = mod(m^k,n)
println("Ecrypted message.: ",c)

# Decryption
m = powermod(c,d,n)
println("Decrypted message: ",Char(m+'0'))
