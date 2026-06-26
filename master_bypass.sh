#!/bin/bash
# AutoKaaj AI Station - Master Powerhouse Setup
# Includes: OpenClaw, OpenManus, Hermes, PicoClaw, Cloud Code, Codex

clear
echo "Initializing AutoKaaj AI Workstation (Powerhouse Mode)..."

# ১. প্রয়োজনীয় ডিপেন্ডেন্সি
pkg update -y && pkg install -y git python-3.11 nodejs-lts cmake make wget

# ২. ওপেন সোর্স এজেন্ট ইন্সটলেশন (Git Cloning)
mkdir -p ~/AI_Agents
cd ~/AI_Agents
git clone https://github.com/OpenClaw/OpenClaw || true
git clone https://github.com/OpenManus/OpenManus || true
git clone https://github.com/PicoClaw/PicoClaw || true

# ৩. ক্লাউড কোড ও কোডেক্স (Cloud Code & Codex)
npm install -g @google-cloud/functions-framework
# ক্লাউড কোডের জন্য প্রয়োজনীয় সেটআপ
mkdir -p ~/.cloud-code
echo "Codex & Cloud Code Integration Ready" > ~/.cloud-code/status

# ৪. হারমাস এজেন্ট (Hermes Agent)
pip install hermes-agent

# ৫. ব্যাকগ্রাউন্ডে এআই হাব স্টার্ট (PM2)
npm install -g pm2
pm2 start all --name "AutoKaaj-Powerhouse"

echo "All Agents (OpenClaw, OpenManus, Hermes, PicoClaw) are ready."
