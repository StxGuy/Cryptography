
function encrypt(s,a,b)
    x = ""
    for c in s
        y = Char('a'+mod(Int(a*(c-'a')+b),26)) 
        x = x*Char(y)
    end
    
    return x
end

function decrypt(s,a,b)
    x = ""
    for c in s
        y = Char('a'+mod(invmod(a,26)*Int(c-'a'-b),26))
        x = x*Char(y)
    end
    
    return x
end
        
a=5
b=8
s = "affinecipher"
enc = encrypt(s,a,b)
dec = decrypt(enc,a,b)

println("Original message.: ",s)
println("Encrypted message: ",enc)
println("Decrypted message: ",dec)
