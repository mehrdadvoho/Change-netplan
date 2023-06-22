#!/bin/bash

cp /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.backup

NETPLAN_FILE="/etc/netplan/00-installer-config.yaml"

NEW_ADDRESSES=("8.8.8.8" "8.8.4.4")

# yq eval '.network.ethernets.ens34.nameservers.addresses += ["$NEW_ADDRESSES"]' -i

for ADDRESS in "${NEW_ADDRESSES[@]}"
do
  yq eval --inplace '.network.ethernets.ens34.nameservers.addresses += ["'"$ADDRESS"'"]' $NETPLAN_FILE
done
netplan apply
