#!/usr/local/bin/bash
version=0.1
version_tag="automated_alias_${version}"

map_file="../../../../commands/alias-map.csv"

standardize () {
  to_standardize=$1
  standard_file=$2

  pwd -P

  while read device_id command_term; do
    entry=$(grep -i -m 1 "^${command_term}," ${map_file})
    if [ ${entry} ]; then
      IFS=',' read raw_command standard <<< ${entry}
      #echo "found match: ${command_term} -> ${standard}"

      printf "%s\t%s\t%s\t%s\n" "${device_id}" "${standard}" "${command_term}" "${version_tag}" >> ${standard_file}

    fi
  done < ${to_standardize}
}


for bucket in $(stat -f %N standardization/*); do
  name=$(basename ${bucket})
  echo "processing bucket ${name}"
  
  cd ${bucket}/all
  
  for device_id in $(stat -f %N *); do
    standardize ${device_id} ../standardized/${device_id}
  done

  cd ../../..
done
