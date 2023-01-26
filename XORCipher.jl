function xor_encryption(plaintext::String, key::String)
    key = repeat(key, div(length(plaintext),length(key))+1)
    key = key[1:length(plaintext)]
        
    ip = 1
    ik = 1
    t = ""
    for i in 1:length(plaintext)
        x = Char(32 + (Int(plaintext[ip]) ⊻ Int(key[ik])))
        t *= x
        ip = nextind(plaintext,ip)
        ik = nextind(key,ik)
    end
    
    return t
end

function xor_decryption(ciphertext::String, key::String)
    key = repeat(key, div(length(plaintext),length(key))+1)
    key = key[1:length(plaintext)]
    
    ip = 1
    ik = 1
    t = ""
    for i in 1:length(ciphertext)
        x = Char((Int(ciphertext[ip])-32) ⊻ Int(key[ik]))
        t *= x
        ip = nextind(ciphertext,ip)
        ik = nextind(key,ik)
    end
    
    return t
end

plaintext = "hello world"
key = "secret"
ciphertext = xor_encryption(plaintext, key)
decrypted_text = xor_decryption(ciphertext, key)

println("Original Text: ", plaintext)
println("Ciphertext: ", ciphertext)
println("Decrypted Text: ", decrypted_text)


