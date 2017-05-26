#!/bin/bash
#
# Script to download Google Book Ngrams dataset and load into HDFS.
#

for i in $(seq 0 1); do
  echo getting $i/9
  wget http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-1gram-20090715-$i.csv.zip
done
