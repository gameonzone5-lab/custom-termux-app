#!/bin/bash
# AutoKaaj AI Station: Node 24+ Master Setup
# Developed by: Chiranjit Majumdar

clear
echo "================================================="
echo "   AutoKaaj AI Station - Initializing Setup...   "
echo "================================================="

# ১. সিস্টেম আপডেট ও প্যাকেজ সেটআপ
pkg update -y && pkg upgrade -y
pkg install -y git python-3.11 wget unzip cmake make nodejs-lts

# ২. Node.js ভার্সন ২৪+ এবং প্যাকেজ
npm install -g npm@latest
npm install -g n8n pm2

# ৩. এআই ইঞ্জিন (Ollama)
if ! command -v ollama &> /dev/null; then
    curl -fsSL https://ollama.com/install.sh | sh
fi

# ৪. ব্যাকগ্রাউন্ড অটোমেশন
pm2 start n8n --name "AutoKaaj-AI" -- start
pm2 save

# ৫. টার্মিনাল ব্র্যান্ডিং
rm -f $PREFIX/etc/motd
echo -e "\e[1;32m=================================================\e[0m\n\e[1;36m           AutoKaaj AI Workstation               \e[0m\n\e[1;33m           Developed by: Chiranjit Majumdar      \e[0m\n\e[1;32m=================================================\e[0m\n\e[1;37m        System: Online | AI Engine: Ready        \e[0m\n\e[1;32m=================================================\e[0m\n" > $PREFIX/etc/motd
echo "PS1='\[\e[1;32m\]AutoKaaj\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\] $ '" >> ~/.bashrc
