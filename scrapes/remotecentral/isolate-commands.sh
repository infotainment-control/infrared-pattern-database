#!/usr/local/bin/bash

while read -r brandURL brand; do

  echo "======= ON BRAND $brand ================================="

  pushd brands/$brand 2>&1 > /dev/null

  mkdir commands

  while read -r deviceURL device; do

    # THIS IS THE CODE TO DO IT
    grep HexCode devices/$device.html | sed 's:</span></td></tr>::g; s:<tr><td width="38%" class="filematchleft"><b>::g; s:</b>.*"> *:	:g' > commands/$device
  
  done < device-list

  popd 2>&1 > /dev/null

done < list-of-brands

