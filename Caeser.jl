
function encrypt(s,n)
    x = ""
    for c in s
        y = Char('a'+mod(Int(c-'a'+n),26)) 
        x = x*Char(y)
    end
    
    return x
end

function decrypt(s,n)
    x = ""
    for c in s
        y = Char('a'+mod(Int(c-'a'-n),26))
        x = x*Char(y)
    end
    
    return x
end
        
n = 5
s = "helloworld"
enc = encrypt(s,n)
dec = decrypt(enc,n)

println("Original message.: ",s)
println("Encrypted message: ",enc)
println("Decrypted message: ",dec)
