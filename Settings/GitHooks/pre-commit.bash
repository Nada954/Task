#  pre-commit.bash
#  Marvel
#
#  Created by MACBOOK on 21/05/2021.

#!/usr/bin/env bash

EXECUTION_DIR="$(pwd)"
SETTINGS=$EXECUTION_DIR/Settings

bash $SETTINGS/SwiftFormat/swiftformat.sh
STRICT=true bash $SETTINGS/SwiftLint/swiftlint.sh

if [ $? -ne 0 ]; then
    exit 1
fi
