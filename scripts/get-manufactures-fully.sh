#!/usr/local/bin/bash

declare -A brand_id_map

while read brand_id brand_name; do
  brand_id_map[${brand_name}]=${brand_id}
done < brands.tsv

while read device_id device_name brand_name; do
  printf ${brand_id_map[$brand_name]}'\t'${device_id}'\n' >> manufactures-via-ids.tsv
done < manufactures.tsv

