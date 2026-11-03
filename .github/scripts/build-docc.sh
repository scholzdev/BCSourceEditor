#!/bin/bash

export LC_CTYPE=en_US.UTF-8

set -o pipefail && xcodebuild clean docbuild -scheme BCSourceEditor \
    -destination generic/platform=macos \
    -skipPackagePluginValidation \
    OTHER_DOCC_FLAGS="--transform-for-static-hosting --hosting-base-path BCSourceEditor --output-path ./docs" | xcpretty
