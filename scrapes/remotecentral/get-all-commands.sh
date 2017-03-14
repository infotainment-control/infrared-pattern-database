#!/usr/local/bin/bash

while read -r brandURL brand; do

  random=$(awk -v min=2 -v max=5 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')

  echo "======= ON BRAND $brand ================================="
  #echo "======= WAITING  $random SECONDS ========================"
  sleep $random

  pushd brands/$brand 2>&1 > /dev/null

  while read -r deviceURL device; do
  
    random=$(awk -v min=2 -v max=4 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
    sleep $random

    rm -rf devices/$device.html
    echo "p-1 ##########-##########" >> devices/$device.html

    curl http://www.remotecentral.com$deviceURL >> devices/$device.html

    nextPage=2

    while [ $(grep --count  page-$nextPage devices/$device.html) -gt 0 ]; do

      fullURL="http://www.remotecentral.com"$deviceURL"page-$nextPage/"

      echo "p-$nextPage ##########-##########" >> devices/$device.html
      curl $fullURL >> devices/$device.html

      let nextPage+=1
    done

  done < device-list

  popd 2>&1 > /dev/null

done < list-of-brands

