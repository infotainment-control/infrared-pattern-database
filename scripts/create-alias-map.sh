#!/usr/local/bin/bash

alias_file="../commands/commands-and-aliases.csv"
map_file="../commands/alias-map.csv"

IFS=','
OFS=','

rm -rf ${map_file}

declare -a alias_to_standard_map

while read key aliases; do

  echo "${key},${key}" >> ${map_file}

  for alias in $(echo "${aliases}"); do
    echo "${alias},${key}" >> ${map_file}
    #echo "  alias=${alias}"
    #cleaned=$(sed 's:+:my_plus:g; s:-:my_minus:g; s:/:my_forward_slash:g; s:\\:my_back_slash:g' <<<${alias})
    #echo "  clean=${cleaned}"
    #alias_to_standard_map["${alias}"]="${key}"
    #alias_to_standard_map["${cleaned}"]="${key}"
    #echo "assigned ${alias} the standard ${key}"
    #echo "assigned ${cleaned} the standard ${key}"
  done

done < ${alias_file}

#printf '%s\n' "${alias_to_standard_map[@]}"
