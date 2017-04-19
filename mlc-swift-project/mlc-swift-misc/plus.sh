#!/bin/bash
for i in {1..100}
do
    for j in {1..100}
    do
        curl -s -o response.out http://localhost:8080/add/$i/and/$j
    done
done

