#  install-hooks.bash
#  Marvel
#
#  Created by MACBOOK on 21/05/2021.

#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)

echo "Installing git hooks..."
if [ -f $GIT_DIR/hooks/pre-commit ]; then
    echo "pre-commit hook is already installed"
else
    ln -sf ../../Settings/GitHooks/pre-commit.bash $GIT_DIR/hooks/pre-commit
    echo "installing hooks finished successfully!"
fi
