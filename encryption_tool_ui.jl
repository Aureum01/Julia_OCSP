using Gtk
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
  # create the main window
  win = Window()
  win.border_width = 10

  # create the text entry widgets
  plaintext_entry = Entry()
  ciphertext_entry = Entry()
  key_entry = Entry()

  # create the encrypt and decrypt buttons
  encrypt_button = Button("Encrypt")
  decrypt_button = Button("Decrypt")

  # create the vertical box layout
  vbox = Box(:vertical)

  # add the text entry widgets and buttons to the layout
  push!(vbox, plaintext_entry)
  push!(vbox, ciphertext_entry)
  push!(vbox, key_entry)
  push!(vbox, encrypt_button)
  push!(vbox, decrypt_button)

  # add the layout to the main window
  win.add(vbox)

  # show the main window
  showall(win)

  # connect the encrypt button to the encrypt function
  encrypt_button.on_clicked = () -> begin
    plaintext = plaintext_entry.text
    key = parse(Int, key_entry.text)
    ciphertext = encrypt(plaintext, key)
    ciphertext_entry.text = ciphertext
  end

  # connect the decrypt button to the decrypt function
  decrypt_button.on_clicked = () -> begin
    ciphertext = ciphertext_entry.text
    key = parse(Int, key_entry.text)
    plaintext = decrypt(ciphertext, key)
    plaintext_entry.text = plaintext
  end

  # start the GTK event loop
  Gtk.main()
end

main()
