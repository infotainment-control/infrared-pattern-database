#!/usr/local/bin/bash

declare -A fullterms

i=1

while read line; do
  #echo "line: ${line}"
  echo "processing line ${i}"
  let "i++"

  key=$(echo ${line} | awk '{print $1$2}')

  #echo "key:${key}"

  fullterms["${key}"]=${line}

  #printf "%s\t%s\t%s\t%s\n" ${fullterms[${key}]}

done < standard.tsv

for record in "${fullterms[@]}"; do
  #echo $record
  printf "%s\t%s\t%s\t%s\n" "${record}" >> deduplicated-standard-tmp.tsv
done

sort -n deduplicated-standard-tmp.tsv > deduplicated-standard.tsv

rm deduplicated-standard-tmp.tsv

