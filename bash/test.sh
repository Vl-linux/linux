#!/bin/bash
arr=(a b c d e f)
for i in "${arr[@]}";do
echo "$i"
done
echo "###"
echo ${arr[0]} 

arr=($(ls)); 
echo ${arr[5]} 


for ((i=0;i<${#arr[@]};i++));do
echo "$i: ${arr[$i]}"
done


i=5
until [[ i -eq 10 ]]; do #Checks if i=10
echo "i=$i" #Print the value of i
i=$((i+1)) #Increment i by 1
done
