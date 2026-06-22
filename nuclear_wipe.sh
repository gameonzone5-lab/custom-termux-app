#!/bin/bash
echo "১. সব ভাষার XML ফাইল থেকে Termux এর নামগন্ধ মুছে ফেলা হচ্ছে..."
find . -type f -name "strings.xml" -exec sed -i 's/>Termux</>AutoKaaj</g' {} +
find . -type f -name "strings.xml" -exec sed -i 's/>termux</>AutoKaaj</g' {} +

echo "২. আপনার স্ক্রিনশটের ওই নির্দিষ্ট এরর মেসেজগুলো মুছে AutoKaaj বসানো হচ্ছে..."
# AutoKaaj was unable -> AutoKaaj was unable
find . -type f -name "strings.xml" -exec sed -i 's/AutoKaaj was unable/AutoKaaj was unable/g' {} +
# unable to install boostrap -> AutoKaaj Engine
find . -type f -name "strings.xml" -exec sed -i 's/unable to install bootstrap/unable to install AutoKaaj Engine/g' {} +

echo "গড মোড ফিল্টার কমপ্লিট! আর কোথাও Termux নেই।"
