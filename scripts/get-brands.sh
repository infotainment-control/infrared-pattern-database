#!/usr/local/bin/bash

if [[ -e all.tsv ]]; then
  #echo "already combined brands. reusing the combined file"
  #echo "(if you included more, please re-run combine-all-data.sh)"

  awk '{print $1}' all.tsv | uniq | awk -v OFS='\t' '{print NR, $1}' | tee brands.tsv
else
  ./combine-all-data.sh | awk '{print $1}' | uniq | awk -v OFS='\t' '{print NR, $1}' | tee brands.tsv
fi

