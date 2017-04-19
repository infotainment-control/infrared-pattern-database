#!/usr/local/bin/bash

rm -rf standardization
mkdir standardization

id_count=$(tail -n1 raw-device-commands.tsv | awk '{print $1}')

bucket_size=200
let bucket_count="(${id_count} + (${bucket_size} - 1)) / ${bucket_size}"

echo "id_count=${id_count}; bucket_count=${bucket_count}"

# create buckets: standardization/bucket_n_to_m with initial n,m = 1,${bucket_size}
# adding them to the array ${bucket_array}
for ((n=1, m=bucket_size, buckets=0; buckets < bucket_count; n+=bucket_size, m=m + bucket_size, buckets++))
do
  if [ $(expr ${buckets} + 1) -eq ${bucket_count} ]; then
    m=${id_count}
  fi
  bucket="standardization/bucket_${n}_to_${m}"

  mkdir -p "${bucket}/all"
  mkdir -p "${bucket}/standardized"

  bucket_array[${buckets}]=${bucket}

done

#for i in $(seq 0 $(expr ${bucket_count} - 1)); do
#  echo "reading bucket array..."
#  echo "bucket ${i} = ${bucket_array[${i}]}"
#done

prev_bucket_index=-1

while IFS=$'\t' read device_id raw_command pronto_hex; do

  bucket_index=$(expr ${device_id} / ${bucket_size})
  if [ ${bucket_index} -ne ${prev_bucket_index} ]; then
    echo "processing bucket ${bucket_index}"
    prev_bucket_index=${bucket_index}
  fi

  bucket="${bucket_array[${bucket_index}]}/all"

  printf "%s\t%s\n" "${device_id}" "${raw_command}" >> ${bucket}/${device_id}

  #printf "%s%t%s" >> ${bucket}/${device_id}

done < raw-device-commands.tsv

  #awk -v OFS='\t' '{print $1, $2}' all.tsv | uniq | awk -v OFS='\t' '{print NR, $2, $1}' | tee manufactures.tsv
