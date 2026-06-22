#!/bin/bash

echo "১. সমস্ত এক্সএমএল (XML) ফাইল থেকে টার্মাক্স মুছে AutoKaaj করা হচ্ছে..."
find . -type f -name "strings.xml" -exec sed -i 's/>Termux</>AutoKaaj</g' {} +
find . -type f -name "strings.xml" -exec sed -i 's/"app_name">Termux/"app_name">AutoKaaj/g' {} +

echo "২. অ্যান্ড্রয়েড ম্যানিফেস্ট (Install Screen) থেকে নাম মোছা হচ্ছে..."
find . -type f -name "AndroidManifest.xml" -exec sed -i 's/android:label="Termux"/android:label="AutoKaaj"/g' {} +
find . -type f -name "AndroidManifest.xml" -exec sed -i 's/android:label="@string\/app_name"/android:label="AutoKaaj"/g' {} +

echo "৩. জাভার ভেতরের হার্ডকোড করা নামগুলো ধ্বংস করা হচ্ছে..."
find . -type f -name "TermuxConstants.java" -exec sed -i 's/"Termux"/"AutoKaaj"/g' {} +

echo "৪. পুরোনো ওয়েলকাম মেসেজ চিরতরে মুছে ফেলা হচ্ছে..."
grep -rl "Welcome to AutoKaaj Environment" . --exclude-dir=.git | xargs sed -i 's/Welcome to AutoKaaj Environment/Welcome to AutoKaaj Environment/g'

echo "৫. টার্মিনালের ভেতরে ডাইনামিক 'AutoKaaj' মেসেজ বসানোর ফাঁদ পাতা হচ্ছে..."
# এই কোডটি অ্যাপ চালু হওয়ার সাথে সাথে ইন্টারনেট থেকে আসা টার্মাক্স মেসেজকে মুছে নিজের মেসেজ বসিয়ে দেবে
find . -type f -name "TermuxActivity.java" -exec sed -i 's/super.onResume();/super.onResume();\n        try { java.io.File motd = new java.io.File(getFilesDir().getAbsolutePath() + "\/usr\/etc\/motd"); if(motd.exists()){ java.nio.file.Files.write(motd.toPath(), "\\n\\033[1;32mWelcome to AutoKaaj Environment!\\033[0m\\nDeveloped by Chiranjit Majumdar\\n\\n".getBytes()); } } catch(Exception e){} /g' {} +

echo "গড মোড সাকসেসফুল! টার্মাক্সের আর কোনো অস্তিত্ব নেই।"
