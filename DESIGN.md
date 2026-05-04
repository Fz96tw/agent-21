# AGENT-21 — Technical Design

# Technical Design

## Overview
Design a simple calculator implemented as a Bash shell script that takes operands and an operator as command line arguments. Each execution should append the input and result to a `history.txt` file located in its working directory.

## Components

### 1. Command Line Argument Parser
- **Functionality**: Parse operands and operator from command line arguments.
- **Error Handling**: Validate argument count to ensure there are exactly three input values (two operands and one operator).

### 2. Calculation Engine
- **Functionality**: Perform basic arithmetic operations based on parsed arguments. Supported operations include addition, subtraction, multiplication, and division.
- **Implementation**: Use a `case` statement in Bash to handle different operators.
- **Error Handling**: Check for division by zero and manage incorrect operators gracefully.

### 3. History Logger
- **Functionality**: Append the input expression and result to `history.txt`.
- **Implementation**: Use Bash I/O redirection to safely append to the file.
- **Error Handling**: Ensure file is writable, handle failures if the file system is read-only.

## Data Flow
1. **Input**: Operands and operator from command line arguments.
2. **Processing**: Pass input to Command Line Argument Parser, then to Calculation Engine.
3. **Output**: Write results to `history.txt` through History Logger.

## Key Decisions
- Bash shell scripting chosen for simplicity and availability across UNIX-like systems.
- Simple text file for history logging for ease of access and manipulation.

## Pseudocode
```bash
#!/bin/bash

# Check for three arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 operand1 operator operand2"
  exit 1
fi

operand1=$1
operator=$2
operand2=$3

# Perform calculation based on the operator
result=""
case "$operator" in
  "+")
    result=$((operand1 + operand2))
    ;;
  "-")
    result=$((operand1 - operand2))
    ;;
  "*")
    result=$((operand1 * operand2))
    ;;
  "/")
    if [ "$operand2" -eq 0 ]; then
      echo "Error: Division by zero"
      exit 1
    fi
    result=$((operand1 / operand2))
    ;;
  *)
    echo "Invalid operator"
    exit 1
esac

# Log to history.txt
echo "$operand1 $operator $operand2 = $result" >> history.txt

echo "Result: $result"
```