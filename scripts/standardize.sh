#!/usr/local/bin/bash


#to_standardize="standardization/bucket_1_to_200/all/1"
to_standardize="standardization/bucket_1_to_200/all/1"
map_file="../commands/alias-map.csv"

while read device_id command_term; do
  entry=$(grep -i -m 1 "^${command_term}," ${map_file})
  if [ ${entry} ]; then
    IFS=',' read raw_command standard <<< ${entry}
    #standard=$(awk -F',' '{print 
    #echo "found match: ${command_term} -> ${entry}"
    echo "found match: ${command_term} -> ${standard}"
  fi
done < ${to_standardize}

