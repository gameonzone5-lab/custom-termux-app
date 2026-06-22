#!/bin/bash
# যেখানে যেখানে Welcome to AutoKaaj Environment আছে, সেটা পরিবর্তন করা হচ্ছে
grep -rl "Welcome to AutoKaaj Environment" . --exclude-dir=.git | xargs sed -i 's/Welcome to AutoKaaj Environment/Welcome to AutoKaaj Environment/g'
echo "Welcome Message Patched Successfully!"
