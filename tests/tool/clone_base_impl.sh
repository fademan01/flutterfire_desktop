#!/bin/sh

set -e

if [ -z "$1" ]; then
    echo "No argument supplied. Pass the firebase package name to extract the commit from."
    exit 1
fi

FIREBASE_PACKAGE_NAME="$1"

if [[ "$FIREBASE_PACKAGE_NAME" != "firebase_auth" && "$FIREBASE_PACKAGE_NAME" != "firebase_core" ]]; then
    echo "Invalid firebase package name."
    exit 1
fi

ROOT_DIR=$(realpath .)
FLUTTERFIRE_COMMIT=$("$ROOT_DIR"/tool/extract_firebase_package_commit.sh $FIREBASE_PACKAGE_NAME)
FLUTTERFIRE_REPO="$ROOT_DIR/flutterfire_repo"

git clone https://github.com/firebase/flutterfire ${FLUTTERFIRE_REPO} || true
pushd ${FLUTTERFIRE_REPO}
git fetch origin
git checkout --force ${FLUTTERFIRE_COMMIT}
popd

echo "Cloned FlutterFire commit: $FLUTTERFIRE_COMMIT"
