#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start AWS ZN VPN
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🌐
#
# Documentation:
# @raycast.author Gustav Kofoed Clausen

check_vpn_is_alive() {
  vpn_alive=$(ps ax | grep AWS | grep isAlive)
  if [ -z "$vpn_alive" ]; then
    open -a "AWS VPN Client"
    osascript -e 'delay 2'
    osascript ~/connect-vpn.applescript >/dev/null
    osascript -e 'delay 5'
    osascript ~/close-all-vpn-tabs.applescript >/dev/null
    exit
  else
    echo "VPN is already connected"
  fi
}

check_vpn_is_alive
