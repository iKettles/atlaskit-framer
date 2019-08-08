#!/bin/sh

# Preserve newlines
IFS=

sourceDir=`dirname $0`
declare -a arr=("addison.framerfx" "atlassian-avatar.framerfx" "atlassian-badge.framerfx" "atlassian-banner.framerfx" "atlassian-breadcrumbs.framerfx" "atlassian-button.framerfx" "atlassian-checkbox.framerfx" "atlassian-color.framerfx" "atlassian-datetime_picker.framerfx" "atlassian-icons.framerfx" "atlassian-lozenge.framerfx" "atlassian-modal_dialog.framerfx" "atlassian-radio.framerfx" "atlassian-range.framerfx" "atlassian-select.framerfx" "atlassian-textarea.framerfx" "atlassian-textfield.framerfx" "atlassian-toggle.framerfx" )

for dir in "${arr[@]}"
do
  cd $dir

  workingDir=$(pwd)

  echo $workingDir

  # Cache previous yarn.lock
  previousYarnLock=$(cat ./yarn.lock)

  # Update dependencies
  yarn > /dev/null

  # Cache new yarn.lock
  newYarnLock=$(cat ./yarn.lock)

  namespacedDependenciesChanged=$(node ../bin/yarn-lock-diff.js @atlaskit $previousYarnLock $newYarnLock)

  if [ "$namespacedDependenciesChanged" == "true" ]; then
    # package was updated
    echo "$dir changed"
  fi

  cd ..
done
