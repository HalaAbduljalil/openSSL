@echo off
openssl x509 -in %1Certificate.pem -pubkey -noout -out %1PublicKey.pub
openssl rand -base64 64 > Task2sharedkey.bin
openssl enc -aes-256-cbc -salt -pbkdf2 -in Task2sharedkey.bin -out Task2sharedkey.bin.enc -pass file:./%1PublicKey.pub
openssl enc -aes-256-cbc -salt -pbkdf2 -in %2 -out %2.enc -pass file:./Task2sharedkey.bin
openssl dgst -sha256 -binary -out Task2.sha256 %2
openssl pkeyutl -sign -in Task2.sha256 -out Task2sign.sha256 -inkey HalaPrivateKey.pem
openssl pkeyutl -verify -sigfile Task2sign.sha256 -in Task2.sha256 -out verifyresult.txt -inkey HalaPublicKey.pem -pubin
openssl pkeyutl -verify -sigfile Task2sign.sha256 -in Task2.sha256 -inkey HalaPublicKey.pem -pubin