#!/usr/bin/env bash
set -ev

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
    BUNDLE_OS_PROFILE="create-runtime-image-linux-x64,package-runtime-image"
else
    if [ "$TRAVIS_OS_NAME" == "osx" ]; then
        BUNDLE_OS_PROFILE="create-runtime-image-macos-x64,package-runtime-image"
    else
         BUNDLE_OS_PROFILE="create-runtime-image-windows-x64,package-runtime-image"
    fi
fi

mvn clean package -P $BUNDLE_OS_PROFILE
