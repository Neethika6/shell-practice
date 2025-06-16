#!/bin/bash

a=("apple" "bat" "cat" "180" "324" )

echo "the first value is ${a[0]}"
echo "the last value is ${a[4]}"
echo "invalid value ${a[5]}"
echo "all values in array: ${a[@]}"

