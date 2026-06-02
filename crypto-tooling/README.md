# Manual for Secure Communication

## Instructional Steps

To send a secure message using the public key:

1. Create your message file:

   ```
   echo "Your secret message" > message.txt
   ```

2. Encrypt the message using the public key:

   ```
   openssl pkeyut1 -encrypt -pubin -inkey public.pem -in message.txt -out encrypted_message.enc
   ```

3. Send the encrypted file (`encrypted_message.enc`) to the recipient.

Only the holder of the private key can decrypt and read the message.

## Decrypting the message

The recipient can decrypt the encrypted file using their private key: 

'''bash
openss1 pkeyut1 -decrypt -inkey private.pem -in encrypted_message.enc -out decrypted_message.txt

# The Math Explained

Think of the public key like an unlocked mailbox (Post Office Box):

* Anyone can drop a message into the mailbox using the public key 
* But only the owner with the private key can open it and read the contents

This ensures secure communication without needing to share secrets beforehand.

---

##️ Safety Warning

The private key (`private.pem`) must NEVER be shared or uploaded to Git.

If someone gains access to the private key:

* They can decrypt all messages
* They can impersonate the key owner

Always keep private keys secure and local.

