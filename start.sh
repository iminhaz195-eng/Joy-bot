#!/bin/bash

# ═══════════════════════════════════════════════════════════════
# ███╗   ███╗███████╗    ███╗   ███╗██╗███╗   ██╗██╗  ██╗ █████╗ ███████╗
# ████╗ ████║╚══███╔╝    ████╗ ████║██║████╗  ██║██║  ██║██╔══██╗╚══███╔╝
# ██╔████╔██║  ███╔╝     ██╔████╔██║██║██╔██╗ ██║███████║███████║  ███╔╝ 
# ██║╚██╔╝██║ ███╔╝      ██║╚██╔╝██║██║██║╚██╗██║██╔══██║██╔══██║ ███╔╝  
# ██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║██║██║ ╚████║██║  ██║██║  ██║███████╗
# ╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
#
#              ★ AUTO RESTARTER — MZ MINHAZ ★
# ═══════════════════════════════════════════════════════════════

# Colors for terminal
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
NC='\033[0m' # No Color

# Config
RESTART_TIME=1800  # 30 minutes (30 * 60 seconds)
DELAY_TIME=2       # 2 seconds delay after stop

clear
echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${PURPLE}▌      MZ MINHAZ AUTO-RESTARTER SYSTEM LOADED               ▌${NC}"
echo -e "${PURPLE}▌      Restart Interval : 30 Minutes                        ▌${NC}"
echo -e "${PURPLE}▌      Delay            : 2 Seconds                         ▌${NC}"
echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"

# Handle Ctrl+C gracefully
trap 'echo -e "\n${RED}[!] Process stopped by user. Exiting...${NC}"; exit 0' SIGINT SIGTERM

SESSION=0

while true; do
    SESSION=$((SESSION+1))
    echo -e "\n${CYAN}[$(date +%T)] ▶️ Starting Session #${SESSION}...${NC}"
    echo -e "${CYAN}[$(date +%T)] 🚀 Running: python3 main.py${NC}"
    echo -e "${PURPLE}───────────────────────────────────────────────────────────────${NC}"
    
    # Run the bot with a 30-minute timeout
    timeout $RESTART_TIME python3 main.py
    
    # Capture exit status
    EXIT_CODE=$?
    
    echo -e "${PURPLE}───────────────────────────────────────────────────────────────${NC}"
    
    if [ $EXIT_CODE -eq 124 ]; then
        echo -e "${YELLOW}[$(date +%T)] ⏳ 30 Minutes completed. Auto-restarting...${NC}"
    elif [ $EXIT_CODE -eq 130 ] || [ $EXIT_CODE -eq 143 ]; then
        echo -e "${RED}[$(date +%T)] 🛑 Bot force stopped.${NC}"
    else
        echo -e "${RED}[$(date +%T)] ❌ Bot crashed (Exit Code: $EXIT_CODE). Auto-restarting...${NC}"
    fi
    
    echo -e "${GREEN}[$(date +%T)] 🔄 Restarting in ${DELAY_TIME} seconds...${NC}"
    
    # Wait for 2 seconds
    sleep $DELAY_TIME
done
