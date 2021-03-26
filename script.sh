#!/bin/bash

token=$(head -n 1 "/home/derleyzim/Área de Trabalho/TentandoAutomatizar/RelatoriosPermissoes/TokenDoGItHub")

while read linguagem dono repositorio; do
  lin_don_rep="${linguagem}_${dono}_${repositorio}"

      > requesicao2.txt

    for i in 1 2; do

     echo $i
     echo $lin_don_rep
      curl -u "derleymad:$token" -H  "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/$dono/$repositorio/pulls?state=closed&page=$i&per_page=100" >> requesicao2.txt
    done

      grep -A 6 number requesicao2.txt | grep -A 5 state | grep -A 4 locked| grep -A 3 title | grep login | sed 's/"login": "//g' |sed 's/",//g' |sort | uniq -c | sort -n -r | cut -c 15-100 > apenasnomes.txt

      grep -A 6 number requesicao2.txt | grep -A 5 state | grep -A4 locked | grep -A 3 title | grep login | sed 's/"login": "//g' |sed 's/",//g' |sort | uniq -c | sort -n -r | cut -c 5-10 > apenasnumeros.txt

      paste -d "," apenasnomes.txt apenasnumeros.txt > "/home/derleyzim/Área de Trabalho/TentandoAutomatizar/ArquivosFinais/$lin_don_rep.csv"

done < "/home/derleyzim/Área de Trabalho/TentandoAutomatizar/RelatoriosPermissoes/repositorios"
