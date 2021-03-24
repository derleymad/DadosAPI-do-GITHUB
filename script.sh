#!/bin/bash

> requesicao2.txt

for i in 1 2; do
	curl -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/freebsd/freebsd-src/pulls?state=closed&page=$i&per_page=100" >> requesicao2.txt

done

grep -A 3 title requesicao2.txt | grep login | sed 's/"login": "//g' |sed 's/",//g' |sort | uniq -c | sort -n -r | cut -c 15-100 > apenasnomes.txt

grep -A 3 title requesicao2.txt | grep login | sed 's/"login": "//g' |sed 's/",//g' |sort | uniq -c | sort -n -r | cut -c 5-10 > apenasnumeros.txt

paste -d "," apenasnomes.txt apenasnumeros.txt > final.txt

#| sort | uniq -c |sort -nk1,1
 
      

