#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 operand1 operator operand2"
    exit 1
fi

operand1=$1
operator=$2
operand2=$3

if ! [[ "$operand1" =~ ^-?[0-9]+$ ]] || ! [[ "$operand2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Operands must be valid integers."
    exit 1
fi

if ! [[ "$operator" =~ ^[+\-*/]$ ]]; then
    echo "Error: Invalid operator. Allowed operators are +, -, *, /."
    exit 1
fi

# Proceed with the calculation
# Calculation logic goes here...
