#!/usr/local/bin/bash

while read -r url brand number; do
  #mkdir -p brands/$brand
  #curl http://www.remotecentral.com$url > brands/$brand/devices.html

  pushd brands/$brand 2>&1 > /dev/null

  sed -e 's/<[^a>/!][^ >][^>]*>//g; s/<\/[^a>][^>]*>//g' all-devices | sed 's/^.\{9\}//; s/.\{4\}$//; s/\/">/\/	/; s/\ /_/g' > device-list

  popd 2>&1 > /dev/null

done < mega


#page-4 exists
#You should curl /cgi-bin/codes/sony/ for it


#http://www.remotecentral.com/cgi-bin/codes/panasonic/page-2/
