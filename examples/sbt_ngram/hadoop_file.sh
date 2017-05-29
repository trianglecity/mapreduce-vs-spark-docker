#!/bin/bash

hadoop fs -mkdir -p data
for i in $(seq 0 1); do
  unzip -cq googlebooks-eng-all-1gram-20090715-$i.csv.zip | /hadoop/hadoop-dist/target/hadoop-2.7.3/bin/hadoop fs -put - data/googlebooks-eng-all-1gram-20090715-$i.tsv
done
