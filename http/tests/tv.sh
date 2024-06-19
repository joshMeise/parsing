#!/bin/bash
rm -f ./pass.* ./fail.* 

# [PASSING TESTS]
echo -en "Host:" > ./pass.1
echo -en "Accept:" > ./pass.2
echo -en "User-Agent:" > ./pass.3
echo -en "Accept-Encoding:" > ./pass.4

# [FAILING TESTS]
echo -en "Ho?t:" > ./fail.1
echo -en "Accept" > ./fail.2
echo -en "User Agent:" > ./fail.3
echo -en "Accept=Encoding:" > ./fail.4

# generate a file with the number of pass and fail tests
#NUMPASS=(pass.*)
#NUMFAIL=(fail.*)
#echo "${#NUMPASS[@]} ${#NUMFAIL[@]}" > ./numtests
