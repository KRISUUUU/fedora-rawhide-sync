#!/usr/bin/env bash
# Installer for Fedora Rawhide Sync by KRISUUUU

set -e
readonly G='\033[0;32m'
readonly C='\033[0;36m'
readonly Y='\033[1;33m'
readonly NC='\033[0m'

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${C}==========================================${NC}"
echo -e "${G} Installing Rawhide Sync by KRISUUUU ${NC}"
echo -e "${C}==========================================${NC}"

if [[ "$EUID" -ne 0 ]]; then
  echo -e "${Y}Please run this installer as root (sudo ./install.sh)${NC}"
  exit 1
fi

if [[ ! -f "$SCRIPT_DIR/rawhide-sync" ]]; then
    echo -e "${R}Error: 'rawhide-sync' script not found in $SCRIPT_DIR${NC}"
    exit 1
fi

echo -e "\n[1/3] Copying script to /usr/local/bin..."
install -m 0755 "$SCRIPT_DIR/rawhide-sync" /usr/local/bin/rawhide-sync

echo -e "\n[2/3] Choose your UI Experience:"
echo "  1) Modern UI (Animated, Requires installing 'gum')"
echo "  2) Classic UI (Pure Bash, No external dependencies)"
read -p "Your choice [1/2]: " ui_choice

if [[ "$ui_choice" == "1" ]]; then
    echo -e "\n${G}Installing 'gum'...${NC}"
    if ! dnf install -y gum; then
        echo -e "${Y}Adding Charm repo...${NC}"
        cat <<EOF > /etc/yum.repos.d/charm.repo
[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key
EOF
        dnf install -y gum
    fi
    echo -e "${G}Modern UI installed successfully!${NC}"
else
    echo -e "${Y}Classic UI selected.${NC}"
fi

echo -e "\n[3/3] Installation Complete!"
echo -e "Run the tool by typing: ${C}sudo rawhide-sync${NC}"
echo -e "${C}==========================================${NC}"