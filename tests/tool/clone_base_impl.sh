#!/bin/sh

set -e

if [ -z "$1" ]; then
    echo "No argument supplied. Pass the firebase package name to extract the commit from."
    exit 1
fi

FIREBASE_PACKAGE_NAME="$1"

ROOT_DIR=$(realpath .)

set +e
FLUTTERFIRE_COMMIT=$("$ROOT_DIR"/tool/extract_firebase_package_commit.sh $FIREBASE_PACKAGE_NAME)
set -e

if [ -z "$FLUTTERFIRE_COMMIT" ]; then
    echo "Failed to extract commit from firebase package."
    exit 1
fi

FLUTTERFIRE_REPO="$ROOT_DIR/flutterfire_repo"

git clone https://github.com/firebase/flutterfire ${FLUTTERFIRE_REPO} || true
pushd ${FLUTTERFIRE_REPO}
git fetch origin
git checkout --force ${FLUTTERFIRE_COMMIT}
popd

echo "Cloned FlutterFire commit: $FLUTTERFIRE_COMMIT"
