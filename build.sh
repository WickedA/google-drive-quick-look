#!/bin/bash
set -euo pipefail

xcodebuild build
rm -rf ~/Library/QuickLook/GoogleDrive.qlgenerator
cp -r build/Release/GoogleDrive.qlgenerator ~/Library/QuickLook/
qlmanage -r
