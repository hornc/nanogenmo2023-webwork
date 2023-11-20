#!/bin/bash

# Script to use Fountain grammar to generate H.S.Keeler's 
# elementary plot combinations in GDF graph diagrams.

for case in $(seq 14); do
  fname=../networks/case-${case}.gdf
  echo "Writing CASE ${case} to ${fname}"
  fountain generate cases.fountain output=1 case=$case > $fname
done

plotcombinations="../PlotCombinations.md"
numerals="I II III IV V VI VII VIII IX X XI XII XIII XIV"

echo "Generating $plotcombinations"
fountain generate cases.fountain output=4 > $plotcombinations

for n in $numerals; do
   sed -i -e "/\[Response\](llm-output\/case-${n}.md)/{r ../llm-output/case-${n}.md" -e "d}" $plotcombinations
done
