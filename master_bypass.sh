#!/bin/bash

# ১. ইন্সটল স্ক্রিনে এবং অ্যাপের ভেতরে টার্মাক্স নাম মুছে AutoKaaj করা
echo "Patching App Install Name..."
find app/src/main -type f -name "strings.xml" -exec sed -i 's/>Termux</>AutoKaaj</g' {} +
find app/src/main -type f -name "strings.xml" -exec sed -i 's/"app_name">Termux/"app_name">AutoKaaj/g' {} +
find app/src/main -type f -name "AndroidManifest.xml" -exec sed -i 's/android:label="Termux"/android:label="AutoKaaj"/g' {} +

# ২. "Welcome to Termux!" মেসেজ বাইপাস করার জন্য UserLAnd স্টাইল ইনজেকশন
echo "Injecting Java Payload for Terminal Screen..."
SESSION_FILE=$(find . -name "TerminalSession.java" | head -n 1)

# ইনজেকশন পেলোড তৈরি করা হচ্ছে
cat << 'INJECT' > payload.txt
        // AutoKaaj Master Bypass for Welcome Message
        try {
            String motdPath = "/data/data/com.termux/files/usr/etc/motd";
            java.io.File motd = new java.io.File(motdPath);
            if(motd.exists()) {
                String newMotd = "\n\033[1;32mWelcome to AutoKaaj Environment!\033[0m\nDeveloped by Chiranjit Majumdar\n\n";
                java.nio.file.Files.write(motd.toPath(), newMotd.getBytes());
            }
        } catch (Exception e) {}
INJECT

# TerminalSession চালু হওয়ার ঠিক শুরুতেই পেলোডটি বসিয়ে দেওয়া হচ্ছে
sed -i '/public TerminalSession(/r payload.txt' "$SESSION_FILE"

echo "Master Bypass Successfully Applied!"
