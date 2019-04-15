#!/bin/sh
BUILD_DIR="./build"

#filename="./build.properties"
#while read -r line; do
#    name="$line"
#    echo "Name read from file - $name"
#done < "$filename"

#echo "$line"
USAGE="Usage:::: ./build.sh OR ./build.sh deploy-artifactory <artifactory url> <api key> <repo name>"

# Validate the arguments
if [[ "$1" = "deploy-artifactory" ]]; then
    if [[ -z "$2" ]]
      then
        echo "No Artifactory URL supplied"
        echo $USAGE
        exit 1
    elif [[ -z "$3" ]]
      then
        echo "No API Key supplied"
        echo $USAGE
        exit 1
    elif [[ -z "$4" ]]
      then
        echo "No Repo Name supplied"
        echo $USAGE
        exit 1
    fi
fi

ZIP_FILE="flight_lambda-0.1.0.zip"
echo $BUILD_DIR
rm -r target
mkdir target
cd target
mkdir temp
cp -a ../src/. temp/
cd temp
zip -r "../$ZIP_FILE" *

if [[ "$1" = "deploy-artifactory" ]]; then
    echo "Deploying artifact!"
    curl -H "X-JFrog-Art-Api:$3" -X PUT "$2/$4/com/kajal/flightbookings/get-flight/0.1.0/$ZIP_FILE" -T "../$ZIP_FILE"
fi