#!/bin/bash
# strings.xml ফাইলের ভেতর থেকে Termux নাম মুছে AutoKaaj বসানো হচ্ছে
find . -type f -name "strings.xml" -exec sed -i 's/>Termux</>AutoKaaj</g' {} +
find . -type f -name "strings.xml" -exec sed -i 's/"app_name">Termux/"app_name">AutoKaaj/g' {} +
echo "App UI Name Patched Successfully!"
