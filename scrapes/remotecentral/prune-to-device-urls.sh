#!/usr/local/bin/bash

while read -r url brand number; do
  #mkdir -p brands/$brand
  #curl http://www.remotecentral.com$url > brands/$brand/devices.html

  pushd brands/$brand 2>&1 > /dev/null

  #process
  for file in $(ls | grep "devices"); do
    brandAccordingToURL=$(basename $url)
    grep -v "page-" $file | grep "<a href=\"/cgi-bin/codes/$brandAccordingToURL" >> all-devices
  done

  echo "$brand:"
  echo "  $number"
  echo "  $(wc -l all-devices)"

  popd 2>&1 > /dev/null

done < mega


#page-4 exists
#You should curl /cgi-bin/codes/sony/ for it


#http://www.remotecentral.com/cgi-bin/codes/panasonic/page-2/
