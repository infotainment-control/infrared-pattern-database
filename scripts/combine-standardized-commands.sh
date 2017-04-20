#!/usr/local/bin/bash

cat standardization/bucket_*/standardized/* | sort -n > standard.tsv

