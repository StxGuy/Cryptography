using Flux
using Random

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


# Create a model with two layers
# the first layer has 26 inputs and 10 outputs
# the second layer has 10 inputs and 26 outputs
# the activation for both layers is a sigmoid function
Model = Chain(
    RNN(95,10), # 10 is the size of the hidden layer
    Dense(10,95,σ),
    softmax
)
 
# Use an optimizer instead of computing the gradient directly
Opt = ADAM(0.01)

for epoch in 1:10000
    error = 0
    key = "secret"
    Y = randstring(10)
    X = xor_encryption(Y, key)

    Flux.reset!(Model)
    for (x,y) in zip(X,Y)
        input = Flux.onehot(x-' '+1,1:95)
        expected = Flux.onehot(y-' '+1,1:95)
        
        output = Model(input)
        error += Flux.crossentropy(output,expected)
        
        ∇ = Flux.gradient(params(Model)) do
            Flux.crossentropy(Model(input),expected)
        end
        Flux.Optimise.update!(Opt,params(Model),∇)
    end
    
    println("Epoch: ",epoch,", Error: ",error/95)
end

# Now you can test your trained neural network.
# As an exercise, input values to it and see if the output is right.

key = "secret"
Y = randstring(10)
X = xor_encryption(Y, key)

Flux.reset!(Model)
for (x,y) in zip(X,Y)
    input = Flux.onehot(x-' '+1,1:95)
    expected = Flux.onehot(y-' '+1,1:95)
    output = Model(input)
    p = argmax(output[:,1])
    
    println("input = ",x," expected = ",y,", got = ",' '-1+p)
end
