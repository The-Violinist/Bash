#!bin/bash
arr=()
arr+=$(ls)

for x in ${arr[@]}
do
echo $x
done