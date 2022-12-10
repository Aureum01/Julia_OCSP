using Random

function encrypt(plaintext::String, key::Int)
  ciphertext = ""
  for c in plaintext
    ciphertext *= Char(mod(Int(c) + key, 128))
  end
  return ciphertext
end

function decrypt(ciphertext::String, key::Int)
  plaintext = ""
  for c in ciphertext
    plaintext *= Char(mod(Int(c) - key, 128))
  end
  return plaintext
end

function main()
  plaintext = "hello world"
  key = rand(1:127)
  ciphertext = encrypt(plaintext, key)
  println("Original text: ", plaintext)
  println("Encrypted text: ", ciphertext)
  println("Decrypted text: ", decrypt(ciphertext, key))
end

main()
