@echo off
openssl req -newkey rsa:2048 -nodes -keyout %1PrivateKey.pem -x509 -days 365 -out %1Certificate.pem
openssl x509 -in %1Certificate.pem -pubkey -noout -out %1PublicKey.pub

start  %1PrivateKey.pem
start  %1PublicKey.pem


