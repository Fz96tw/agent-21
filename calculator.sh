#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: ./calculator.sh number1 operator number2"
    exit 1
fi

num1=$1
operator=$2
num2=$3

result=""

case "$operator" in
    +)
        result=$(echo "$num1 + $num2" | bc -l)
        ;;  
    -)
        result=$(echo "$num1 - $num2" | bc -l)
        ;;  
    \*)
        result=$(echo "$num1 * $num2" | bc -l)
        ;;  
    /)
        if [ "$num2" == "0" ]; then
            echo "Error: Division by zero"
            exit 1
        fi
        result=$(echo "$num1 / $num2" | bc -l)
        ;;  
    *)
        echo "Error: Invalid operator"
        exit 1
        ;;  
esac

echo "$num1 $operator $num2 = $result"

echo "$num1 $operator $num2 = $result" >> history.txt
