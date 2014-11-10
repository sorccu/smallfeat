#!/usr/bin/env bash

# Fail on error, verbose output
set -exo pipefail

# Build project
ndk-build 1>&2

# Figure out which ABI and SDK the device has
abi=$(adb shell getprop ro.product.cpu.abi | tr -d '\r')
sdk=$(adb shell getprop ro.build.version.sdk | tr -d '\r')

# PIE is only supported since SDK 16
if (($sdk >= 16)); then
  bin=smallfeat
else
  bin=smallfeat-nopie
fi

# Upload the binary
adb push libs/$abi/$bin /data/local/tmp/

# Run!
adb shell /data/local/tmp/$bin "$@"
