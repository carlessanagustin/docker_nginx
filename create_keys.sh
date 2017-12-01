#!/bin/bash

Country_Name=ES
State_Name=Catalunya
Locality=Barcelona
Organization="Example Co"
Common_Name=www.example.com

cd etc/nginx/certs/

openssl genrsa -out https.key 2048
openssl req -new -x509 -sha256 -days 3650 \
    -key https.key -out https.crt  \
    -subj "/C=$Country_Name/ST=$State_Name/L=$Locality/O=$Organization/CN=$Common_Name"
