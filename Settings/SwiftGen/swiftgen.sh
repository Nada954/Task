#  swiftgen.sh
#  Marvel
#
#  Created by MACBOOK on 21/05/2021.

#!/bin/bash

BASEDIR=$(dirname "$0")
EXECUTION_DIR="$(pwd)"

printf "\nExecuting SwiftGen from ${EXECUTION_DIR}\n"

${PODS_ROOT}/SwiftGen/bin/swiftgen config run --config $BASEDIR/swiftgen.yml

echo "Generating resources done successfully!"
