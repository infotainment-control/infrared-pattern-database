#!/usr/local/bin/bash

declare -A brand_id_map

while read brand_id brand_name; do
  brand_id_map[${brand_name}]=${brand_id}
done < brands.tsv

while read device_id device_name brand_name; do
  echo ${device_id} id_of ${device_name} is_produced_by ${brand_name} of_id ${brand_id_map[$brand_name]}
done < manufactures.tsv

