#!/bin/bash
grep '^\s*@' references.bib|grep -Po '(?<={).*(?=,)'|sort -u>all
grep -hPo '(?<=\\cite).+?{*?(?=})' *.tex|grep -Po '(?<={).*'|sed 's/,/\n/g'|sort -u>used
comm -23 all used>unused
wc -l used unused
for i in `cat unused`; do
  echo $i
  sed -i "/{$i,/,/^\s*}/d" references.bib
done|tqdm --total `wc -l unused | cut -f1 -d' '` --unit " references">/dev/null
rm -f all used unused
