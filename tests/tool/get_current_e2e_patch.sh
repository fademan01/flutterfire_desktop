#!/bin/sh

set -e

if [ -z "$1" ]
  then
    echo "No argument supplied. Pass the firebase package name to extract the commit from."
    exit 1
fi

FIREBASE_PACKAGE_NAME="$1"

if [[ "$FIREBASE_PACKAGE_NAME" != "firebase_auth" && "$FIREBASE_PACKAGE_NAME" != "firebase_core" ]]; then
    echo "Invalid firebase package name."
    exit 1
fi 

ROOT_DIR=$(realpath .)
FLUTTERFIRE_REPO_E2E_PATH="$ROOT_DIR"/flutterfire_repo/tests
DART_REPO_E2E_PATH="$ROOT_DIR"

tool/clone_base_impl.sh $FIREBASE_PACKAGE_NAME


#### Create diff of e2e files #####
rm -rf diff
mkdir diff

PATCH_PATH="$ROOT_DIR"/patches/e2e-$FIREBASE_PACKAGE_NAME.patch

pushd diff
ln -s "$FLUTTERFIRE_REPO_E2E_PATH/integration_test/$FIREBASE_PACKAGE_NAME" flutterfire
ln -s "$DART_REPO_E2E_PATH/integration_test/$FIREBASE_PACKAGE_NAME" dart

rm "$PATCH_PATH" || true
diff -x "flutterfire_repo" -dur flutterfire dart > "$PATCH_PATH" || true
popd
rm -rf diff
###################################
