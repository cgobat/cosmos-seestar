#!/bin/bash

DATETIME=$(date -u +%Y%m%d%H%M%S)
BUILD_VERSION="0.0.0.$DATETIME"

../openc3.sh cli rake build VERSION="$BUILD_VERSION" && \
../openc3.sh cli load openc3-cosmos-seestar-$BUILD_VERSION.gem && \
rm openc3-cosmos-seestar-$BUILD_VERSION.gem
