#!/bin/sh

# Preserve newlines
IFS=

# Iterate over Framer projects
for framerProject in *.framerfx;
do
  # Switch to project directory
  cd $framerProject

  # Cache previous yarn.lock
  previousYarnLock=$(cat ./yarn.lock)

  # Update dependencies
  yarn > /dev/null

  # Cache new yarn.lock
  newYarnLock=$(cat ./yarn.lock)

  # Check if any namespaced dependencies changes
  namespacedDependenciesChanged=$(node ../bin/yarn-lock-diff.js @atlaskit $previousYarnLock $newYarnLock)

  if [ "$namespacedDependenciesChanged" == "true" ]; then
    echo "$framerProject had dependency updates"
  else
    echo "$framerProject had no dependency updates"
  fi 

  # Switch back to root directory
  cd ..
done
