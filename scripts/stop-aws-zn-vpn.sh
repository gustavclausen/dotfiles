#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop AWS ZN VPN
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🚫

# Documentation:
# @raycast.author Gustav Kofoed Clausen

check_vpn_is_alive() {
  vpn_alive=$(ps ax | grep AWS | grep isAlive)
  if [ -n "$vpn_alive" ]; then
    open -a "AWS VPN Client"
    osascript ~/disconnect-vpn.applescript >/dev/null
    exit
  else
    echo "VPN is not connected"
  fi
}

check_vpn_is_alive
