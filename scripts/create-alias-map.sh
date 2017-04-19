#!/usr/local/bin/bash

alias_file="../commands/commands-and-aliases.csv"

IFS=','


#declare -a map
#k="greeting+"
#sed 's:+:my_plus:g' <<<${k}
#map["${k}"]="hello"
#printf '%s\n' "${map[@]}"

declare -a alias_to_standard_map

while read key aliases; do

  # identity entry
  alias_to_standard_map["${key}"]="${key}"

  #echo "key=${key}"
  #echo "aliases=${aliases}"

  for alias in $(echo "${aliases}"); do
    #echo "  alias=${alias}"
    cleaned=$(sed 's:+:my_plus:g; s:-:my_minus:g; s:/:my_forward_slash:g; s:\\:my_back_slash:g' <<<${alias})
    #echo "  clean=${cleaned}"
    #alias_to_standard_map["${alias}"]="${key}"
    alias_to_standard_map["${cleaned}"]="${key}"
    #echo "assigned ${alias} the standard ${key}"
    #echo "assigned ${cleaned} the standard ${key}"
  done

done < ${alias_file}

printf '%s\n' "${alias_to_standard_map[@]}"

#$ ./create-alias-map.sh 
#  alias=PWR
#assigned PWR to POWER
#  alias=VOL+
#./create-alias-map.sh: line 19: VOL+: syntax error: operand expected (error token is "+")
#VOLUME_UP
