#!/bin/bash

DATETIME=$(date -u +%y%m%d%H%M%S)

../openc3.sh cli rake build VERSION="$DATETIME" && \
../openc3.sh cli load openc3-cosmos-seestar-$DATETIME.gem && \
rm openc3-cosmos-seestar-$DATETIME.gem
