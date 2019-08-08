## declare an array variable
declare -a arr=("addison.framerfx")

for i in "${arr[@]}"

do

cd "$i" && yarnLockBefore=$(<yarn.lock) && echo "$yarnLockBefore" && yarn && yarnLockAfter=$(<yarn.lock) && echo "$yarnLockAfter"

if [ "$yarnLockBefore" == "$yarnLockAfter" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi

done

