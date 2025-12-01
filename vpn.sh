#!/bin/bash

# ===========================
# CONFIGURATION SECTION
# ===========================
# Map VPN "names" → actual .ovpn filenames (without path)
# Add more entries here as needed.
# For detailed instruction please read README.md

declare -A VPN_MAP
VPN_MAP["academy"]="academy.ovpn"
VPN_MAP["work"]="work.ovpn"
VPN_MAP["personal"]="personal.ovpn"
# Add more: VPN_MAP["name"]="file.ovpn"

# Base directory where .ovpn files are stored - Default: current users home directory 
VPN_DIR="$HOME/vpns" # change as needed - Create a directory named 'vpns' in your home directory. Place the .ovpn files in the 'vpns' directory


# ===========================
# SCRIPT LOGIC
# ===========================
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <vpn-name>"
    echo "Available options:"
    for key in "${!VPN_MAP[@]}"; do
        echo " - $key"
    done
        exit 1
fi

VPN_KEY="$1"

# Check if the option exists
if [[ -z "${VPN_MAP[$VPN_KEY]}" ]]; then
        echo "Error: Unknown VPN option '$VPN_KEY'"
        echo "Available options:"
    for key in "${!VPN_MAP[@]}"; do
        echo " - $key"
    done
        exit 1
fi

OVPN_FILE="${VPN_MAP[$VPN_KEY]}"
FULL_PATH=$(find "$VPN_DIR" -type f -name "$OVPN_FILE" 2>/dev/null | head -n 1)

if [[ -z "$FULL_PATH" ]]; then
    echo "Could not find: $OVPN_FILE in $VPN_DIR"
    exit 1
fi

echo "Starting VPN: $VPN_KEY -> $FULL_PATH"
sudo openvpn "$FULL_PATH"
