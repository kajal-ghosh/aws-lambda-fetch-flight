#!/bin/sh
BUILD_DIR="target"

USAGE="Usage:::: ./build.sh OR ./build.sh deploy-artifactory <artifactory url> <api key> <repo name>"

ZIP_FILE="flight_lambda-0.1.0.zip"

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
    echo "Deploying artifact!"
    cd $BUILD_DIR
    curl -H "X-JFrog-Art-Api:$3" -X PUT "$2/$4/com/kajal/flightbookings/get-flight/0.1.0/$ZIP_FILE" -T "./$ZIP_FILE"
else
    echo $BUILD_DIR
    rm -r $BUILD_DIR
    mkdir $BUILD_DIR
    cd $BUILD_DIR
    mkdir temp
    cp -a ../src/. temp/
    cd temp
    zip -r "../$ZIP_FILE" *
fi