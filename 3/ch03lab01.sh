#!/bin/bash

mkdir /root/backup 2>/dev/null
cp /etc/NetworkManager/system-connections/*.nmconnection /root/backup

for nmcon in $(ls /etc/NetworkManager/system-connections/*.nmconnection); do
    sed '0,/method=.*/ s//method=manual/' -i "${nmcon}"
    sed '/address1=.*/d' -i "${nmcon}"
    sed '/\[ipv4\]/a address1=1.1.1.1\/24' -i "${nmcon}"
done
