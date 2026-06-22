#!/bin/bash
find . -type f -name "strings.xml" -exec sed -i 's/Termux was unable/AutoKaaj was unable/g' {} +
find . -type f -name "strings.xml" -exec sed -i 's/Unable to install bootstrap/Unable to install AutoKaaj Engine/g' {} +
echo "Error messages patched successfully!"
