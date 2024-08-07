#!/bin/bash

mkdir /root/backup 2>/dev/null
cp /etc/NetworkManager/system-connections/*.nmconnection /root/backup

for nmcon in $(nmcli con show --active | awk '{print $1}' | tail -n+2);
do
    nmcli con mod "${nmcon}" ipv4.ignore-auto-dns yes >/dev/null;
    nmcli con mod "${nmcon}" -ipv4.dns "" >/dev/null
done

truncate -s 0 /etc/resolv.conf
