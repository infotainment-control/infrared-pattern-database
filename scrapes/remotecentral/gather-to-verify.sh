#!/usr/local/bin/bash

for brand in $(ls brands); do
  echo "==========================================================="
  echo "[$brand]==================================================="
  echo "==========================================================="
  for device in $(ls brands/$brand/commands); do
    echo "==========[$device]========================================="
    # modify the below cat to prepend other fields, after verification
    cat brands/$brand/commands/$device
  done
done

