#!/bin/sh

set -e

if [ -z "$1" ]; then
  # No argument supplied. Pass the firebase package name to extract the commit from.
  exit 1
fi

FIREBASE_PACKAGE_NAME="$1"

if [[ "$FIREBASE_PACKAGE_NAME" != "firebase_auth" &&
  "$FIREBASE_PACKAGE_NAME" != "firebase_core" &&
  "$FIREBASE_PACKAGE_NAME" != "cloud_functions" ]]; then
  # Invalid firebase package name.
  exit 1
fi

#echo "Extracting commit from $FIREBASE_PACKAGE_NAME"

ROOT_DIR=$(realpath .)
BASE_IMPLS_FILE="$ROOT_DIR/patches/base_implementations.txt"
PATTERN="$FIREBASE_PACKAGE_NAME"': ([0-9a-fA-F]+)'
# Look for commit_hash in base_implementations.txt as follows: "<package_name>: <commit_hash>"
FLUTTERFIRE_COMMIT=$(cat $BASE_IMPLS_FILE | grep -oE "$PATTERN" | sed -E 's/'$FIREBASE_PACKAGE_NAME': (.*)/\1/')

echo "$FLUTTERFIRE_COMMIT"
