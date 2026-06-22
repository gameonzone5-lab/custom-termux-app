#!/bin/bash

echo "১. ম্যানিফেস্ট ফাইলের সম্পূর্ণ নিয়ন্ত্রণ নেওয়া হচ্ছে..."
# এই কমান্ডটি AndroidManifest.xml-এর ভেতরে থাকা সমস্ত android:label (তা সে যাই লেখা থাকুক না কেন) মুছে জোরপূর্বক AutoKaaj বসিয়ে দেবে।
find . -type f -name "AndroidManifest.xml" -exec sed -i 's/android:label="[^"]*"/android:label="AutoKaaj"/g' {} +

echo "২. সমস্ত ভাষার ফোল্ডার থেকে (বাংলা, হিন্দি ইত্যাদি) নাম মোছা হচ্ছে..."
find . -type f -name "strings.xml" -exec sed -i 's/>Termux</>AutoKaaj</g' {} +
find . -type f -name "strings.xml" -exec sed -i 's/>termux</>AutoKaaj</g' {} +
find . -type f -name "strings.xml" -exec sed -i 's/>টারমাক্স</>AutoKaaj</g' {} +

echo "৩. অ্যাপ্লিকেশনের টাইটেল মুছে ফেলা হচ্ছে..."
find . -type f -name "strings.xml" -exec sed -i 's/name="app_name">.*</name="app_name">AutoKaaj</g' {} +

echo "কাজ শেষ! টার্মাক্সের নাম এখন ১০০% মুছে গেছে।"
