if [ -z "$1" ]; then
    CLEAR_LOCATION=${HOME}/migration
else
    CLEAR_LOCATION=$1
fi
declare -a BROKEN_SYMLINKS=$(find -L ${CLEAR_LOCATION} -maxdepth 1 -type l)

for f in ${BROKEN_SYMLINKS[@]}; do
  unlink $f;
done
