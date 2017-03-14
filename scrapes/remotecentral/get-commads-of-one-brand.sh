#!/usr/local/bin/bash

brand="3M"

pushd brands/$brand 2>&1 > /dev/null

while read -r deviceURL device; do

  rm -rf devices/$device.html
  echo "p-1 ##########-##########" >> devices/$device.html

  curl http://www.remotecentral.com$deviceURL >> devices/$device.html

  nextPage=2

  while [ $(grep --count  page-$nextPage devices/$device.html) -gt 0 ]; do
    #echo "page-$nextPage exists"

    fullURL="http://www.remotecentral.com"$deviceURL"page-$nextPage/"

    echo "p-$nextPage ##########-##########" >> devices/$device.html
    curl $fullURL >> devices/$device.html
    let nextPage+=1
  done

done < device-list

popd 2>&1 > /dev/null

