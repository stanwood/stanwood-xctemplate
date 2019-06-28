#!/usr/bin/env bash

echo "Shell is working $1"

# Clone xcode templates
echo "Cloning project tempalte..."
git clone git@github.com:stanwood/Xcode_Templates_iOS.git creat_xcode_template
cd creat_xcode_template/Template/

echo "Executing command..."
ruby configure $1

cd ..
echo "Preparing final steps..."
mv $1 ..
cd ..

echo "Finishing installation!"
rm -rf creat_xcode_template

echo "Openning ${purple}$1/$1.xcworkspace..."
open "$1/$1.xcworkspace"

echo "${purple}$1 is ready!"
