#  swiftformat.sh
#  Marvel
#
#  Created by MACBOOK on 21/05/2021.

#!/bin/bash

BASEDIR=$(dirname "$0")
EXECUTION_DIR="$(pwd)"
export PODS_ROOT=$EXECUTION_DIR/Pods
    
printf "\nExecuting SwiftFormat from ${EXECUTION_DIR}\n"
    
git diff --diff-filter=d --staged --name-only | grep -e '\.swift$' | while read line; do
    ${PODS_ROOT}/SwiftFormat/CommandLineTool/swiftformat . --config $BASEDIR/../../Settings/SwiftFormat/.swiftformat --quiet "${line}";
    git add "$line";
done
    
echo "Formatting done successfully!"
