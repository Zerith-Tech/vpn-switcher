# vpn-switcher
A lightweight Bash script that lets you launch OpenVPN profiles using simple aliases — no need to type full paths or remember filenames.

## Features
- Map short VPN names to .ovpn profile files
- Clean command-line usage: ./vpn.sh work
- Auto-searches the profile file in a directory
- Clear error messages & available options list
- Easy to extend — just edit the VPN_MAP section

## Installation

Clone the repo:
```
git clone https://github.com/<your-username>/vpn-switcher.git
cd vpn-switcher
```

Make the script executable:
```
chmod +x vpn.sh
```

Now you can run it simply as:
```
./vpn.sh work
```
## Directory Setup

The script expects your .ovpn files to be inside:
```
~/vpns/
```

### Example:
```
~/vpns/work.ovpn
~/vpns/academy.ovpn
~/vpns/personal.ovpn
```

You can change this directory in the script:
```
VPN_DIR="$HOME/vpns"
```

## Usage

Check available VPN names:
```
./vpn.sh
```

Connect to a VPN:
```
./vpn.sh academy
```

The script internally runs:
```
sudo openvpn /path/to/file.ovpn
```

## Adding More VPN Profiles

Inside vpn.sh:
```
VPN_MAP["newvpn"]="newvpn.ovpn"
```

Just drop the .ovpn file into your ~/vpns/ folder.

## Requirements

- Bash
- OpenVPN
- Install with:
```
sudo apt install openvpn
```
