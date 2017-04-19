#!/usr/local/bin/bash

rm raw-device-commands.tsv

declare -A device_id_map

while IFS=$'\t' read device_id device_name brand_name; do
  key=${brand_name}${device_name}
  device_id_map[${key}]=${device_id}
done < manufactures.tsv

while IFS=$'\t' read brand_name device_name command_name pronto_hex; do
  #echo "pronto hex = " ${pronto_hex}
  key=${brand_name}${device_name}
  #printf "${device_id_map[$key]}\t${command_name}\t${pronto_hex}\n" >> raw-device-commands.tsv
  printf "%s\t%s\t%s\n" "${device_id_map[$key]}" "${command_name}" "${pronto_hex}" >> raw-device-commands.tsv
done < all.tsv

  #printf ${brand_id_map[$brand_name]}'\t'${device_id}'\n' >> manufactures-via-ids.tsv
