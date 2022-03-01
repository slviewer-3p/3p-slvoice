#!/bin/bash

WIN32_FILE=slvoice-4.10.0000.32327.5fc3fe7c.558436-windows-558436.tar.bz2
WIN64_FILE=slvoice-4.10.0000.32327.5fc3fe7c.558436-windows64-558436.tar.bz2
WIN32_URL=https://automated-builds-secondlife-com.s3.amazonaws.com/ct2/80382/758550/$WIN32_FILE
WIN64_URL=https://automated-builds-secondlife-com.s3.amazonaws.com/ct2/80381/758551/$WIN64_FILE

cp -a ../bin/* .

rm -rf dl
mkdir -p dl
cd dl
curl -LO $WIN32_URL
curl -LO $WIN64_URL

mkdir -p win32
tar xf $WIN32_FILE -C win32/
mkdir -p win64
tar xf $WIN32_FILE -C win64/
cd ..

mkdir -p win32
mkdir -p win64
cp -a dl/win32/lib/release/* win32/
cp -a dl/win32/bin/release/* win32/

cp -a dl/win64/lib/release/* win64/
cp -a dl/win64/bin/release/* win64/
find . -name *.pdb | xargs rm

echo 3.2 > Version.txt
