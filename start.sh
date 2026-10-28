#!/bin/bash

# MZ MINHAZ TCP BOT - Auto Restarter
# 1.25 hours = 4500 seconds

echo "=========================================="
echo "   Starting MZ MINHAZ Auto-Restarter..."
echo "=========================================="

while true; do
    echo ""
    echo "[$(date +%T)] ▶️ Starting Bot (main.py)..."
    
    # timeout 4500 mane 1.25 ghonta por automatically process ta kill hobe
    timeout 4500 python3 main.py
    
    echo ""
    echo "[$(date +%T)] ⏳ 1.25 hours complete (ba bot crash hoyeche)."
    echo "[$(date +%T)] 🔄 Restarting in 5 seconds..."
    
    sleep 5
done
