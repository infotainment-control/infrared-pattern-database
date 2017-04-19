#!/usr/local/bin/bash


cat ../raw-data/*/* | sort | tee all.tsv
