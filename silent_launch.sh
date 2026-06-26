#!/bin/bash
# AutoKaaj AI Station - Fully Automated Silent Mode
clear
export PS1=" "

# ব্যাকগ্রাউন্ডে সব সেটআপ রান করা
if [ ! -f ~/.ai_ready ]; then
    echo "AutoKaaj AI Station is initializing... Please wait."
    ./master_bypass.sh > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        touch ~/.ai_ready
    fi
fi

# ড্যাশবোর্ডে রিডাইরেক্ট
clear
if [ -f ./ai_dashboard.sh ]; then
    exec ./ai_dashboard.sh
else
    echo "AI Engine Ready. Dashboard loading..."
fi
