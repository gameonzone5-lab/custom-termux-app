#!/bin/bash
# AutoKaaj AI Silent Launch Mode
# Developed by: Chiranjit Majumdar

clear
export PS1=" "

if [ ! -f ~/.ai_ready ]; then
    echo "AutoKaaj AI Station is initializing..."
    ./master_bypass.sh > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        touch ~/.ai_ready
    fi
fi

clear
if [ -f ./ai_dashboard.sh ]; then
    exec ./ai_dashboard.sh
else
    echo "AI Dashboard not found!"
fi
