openssl x509 -in %2Certificate.pem -pubkey -noout -out %2PublicKey.pub
openssl enc -d -aes-256-cbc -salt -pbkdf2 -in Task2sharedkey.bin.enc -out dec_sharedkey.bin -pass file:./%1PrivateKey.pem
openssl enc -in %3 -out %3.dec -d -aes256 -k Task2sharedkey.bin
openssl pkeyutl -sign -in Task2.sha256 -out Hashsign.sha256 -inkey %1PrivateKey.pem
openssl pkeyutl -verify -sigfile Hashsign.sha256 -in Task2.sha256 -inkey %1PublicKey.pub -pubin