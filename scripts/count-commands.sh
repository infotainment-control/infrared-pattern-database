#!/usr/local/bin/bash

awk -F'\t' '{print $2}' raw-device-commands.tsv  | sort |  uniq -c | sort -nr | sed 's:^\ *::g; s:\ :	:' > term-occurrences.tsv

