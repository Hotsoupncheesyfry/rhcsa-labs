#!/bin/bash

mkdir /root/backup 2>/dev/null
cp /etc/NetworkManager/system-connections/*.nmconnection /root/backup

for nmcon in $(nmcli con show --active | awk '{print $1}' | tail -n+2);
do
    nmcli con mod "${nmcon}" connection.autoconnect no >/dev/null;
    nmcli con down "${nmcon}" >/dev/null
done
