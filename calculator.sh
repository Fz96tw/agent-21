#!/bin/bash

# Simple Bash calculator script

if [ $# -ne 3 ]; then
  echo "Usage: $0 operand1 operator operand2"
  exit 1
fi

operand1=$1
operator=$2
operand2=$3

case $operator in
  +)
    result=$((operand1 + operand2))
    ;;  
  -)
    result=$((operand1 - operand2))
    ;;  
  *)
    if [ "$operand2" -eq 0 ]; then
      echo "Error: Division by zero"
      exit 1
    fi
    result=$((operand1 / operand2))
    ;;  
 esac

# Print the result
echo "Result: $result"
