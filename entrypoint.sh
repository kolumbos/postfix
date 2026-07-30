#!/bin/sh

if [ -n "${UPDATE_MAPS}"]; then
  readarray -td, maps_array <<<"${UPDATE_MAPS}"
  declare -p maps_array
  for map in "${maps_array[@]}"; do
    echo "hashing map $map"
    /usr/sbin/postmap $map
  done
fi

echo "updating aliases"
/usr/bin/newaliases

exec "$@"
