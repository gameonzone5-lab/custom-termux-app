#!/bin/bash

echo "টার্মাক্সের লুকিয়ে থাকা নামগুলো ধ্বংস করা হচ্ছে..."

# ১. প্রজেক্টের সমস্ত strings.xml ফাইলে পরিবর্তন (লুকিয়ে থাকা termux-shared ফোল্ডার সহ)
find . -type f -name "strings.xml" -exec sed -i 's/>Termux</>AutoKaaj</g' {} +
find . -type f -name "strings.xml" -exec sed -i 's/> Termux </> AutoKaaj </g' {} +

# ২. সমস্ত AndroidManifest ফাইলে (যেখান থেকে ইন্সটল স্ক্রিন নাম পড়ে) লেবেল পরিবর্তন
find . -type f -name "AndroidManifest.xml" -exec sed -i 's/android:label="Termux"/android:label="AutoKaaj"/g' {} +
find . -type f -name "AndroidManifest.xml" -exec sed -i 's/android:label="@string\/app_name"/android:label="AutoKaaj"/g' {} +

# ৩. সেটিংস বা অন্য কোথাও হার্ডকোড করা থাকলে সেগুলোর জন্য ফিল্টার
grep -rl 'name="app_name"' . --include="strings.xml" | xargs sed -i 's/>.*</>AutoKaaj</g'

echo "ফিল্টার সাকসেসফুল! এবার ইন্সটল স্ক্রিনে শুধু AutoKaaj দেখাবে।"
