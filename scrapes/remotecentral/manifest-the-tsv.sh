#!/usr/local/bin/bash

the_tsv=$1

rm -rf $the_tsv

for brand in $(ls brands); do

  for device in $(ls brands/$brand/commands); do

    #while read name pattern; do
    while read; do

      #printf "%s\t%s\t%s\t" $brand $device $name && echo $pattern
      #printf "%s\t%s\t%s\t" "$brand" "$device" $name && echo $pattern
      printf "%s\t%s\t" "$brand" "$device" && echo "$REPLY"

    done < brands/$brand/commands/$device >> $the_tsv
  done
done

