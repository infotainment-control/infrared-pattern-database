#!/usr/local/bin/bash

while read -r url brand; do
  #mkdir -p brands/$brand
  #curl http://www.remotecentral.com$url > brands/$brand/devices.html

  pushd brands/$brand 2>&1 > /dev/null

  nextPage=2

  while [ $(grep --count  page-$nextPage devices.html) -gt 0 ]; do
    #echo "page-$nextPage exists"


    fullURL="http://www.remotecentral.com"$url"page-$nextPage/"
    outFile="devices-"$nextPage".html"
    #echo "the command would be in $(pwd) comprised of: curl $fullURL > $outFile"
    curl $fullURL > $outFile
    let nextPage+=1
  done

  popd 2>&1 > /dev/null

done < brand-list


#page-4 exists
#You should curl /cgi-bin/codes/sony/ for it


#http://www.remotecentral.com/cgi-bin/codes/panasonic/page-2/
