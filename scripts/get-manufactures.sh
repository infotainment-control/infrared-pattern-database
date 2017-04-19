#!/usr/local/bin/bash

if [[ -e all.tsv ]]; then
  #echo "already combined brands. reusing the combined file"
  #echo "(if you included more, please re-run combine-all-data.sh)"

  awk -v OFS='\t' '{print $1, $2}' all.tsv | uniq | awk -v OFS='\t' '{print NR, $2, $1}' | tee manufactures.tsv
else
  ./combine-all-data.sh | awk -v OFS='\t' '{print $1, $2}' | uniq | awk -v OFS='\t' '{print NR, $2, $1}' | tee manufactures.tsv
fi

