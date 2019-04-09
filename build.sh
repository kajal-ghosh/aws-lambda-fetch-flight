#!/bin/sh
BUILD_DIR="./build"
ZIP_FILE="flight_lambda.zip"
echo $BUILD_DIR
rm -r target
mkdir target
cd target
mkdir temp
cp -a ../src/. temp/
cd temp
zip -r "../$ZIP_FILE" *
