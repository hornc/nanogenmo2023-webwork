#!/bin/bash

# Script to use Fountain grammar to generate H.S.Keeler's 
# elementary plot combinations in GDF graph diagrams.

for case in $(seq 14); do
  fname=../networks/case-${case}.gdf
  echo "Writing CASE ${case} to ${fname}"
  fountain generate cases.fountain output=1 case=$case > $fname
done
