#!/bin/bash

# Array of unnecessary RPC services
declare -a unnecessary_rpc_services=("rpc.cmsd" "rpc.ttdbserverd" "sadmind" "rusersd" "walld" "sprayd" "rstatd" "rpc.nisd" "rexd" "rpc.pcnfsd" "rpc.statd" "rpc.ypupdated" "rpc.rquotad" "kcms_server" "cachefsd")

# Loop through each unnecessary RPC service
for rpc_service in "${unnecessary_rpc_services[@]}"
do
  # Check if the service file exists
  if [[ -f "/etc/xinetd.d/$rpc_service" ]]; then
    echo "Disabling $rpc_service service..."

    # Disable the service in its file
    sed -i 's/disable[[:space:]]*=[[:space:]]*no/disable = yes/g' "/etc/xinetd.d/$rpc_service"

    echo "$rpc_service service has been disabled."
  else
    echo "$rpc_service service file not found."
  fi
done
