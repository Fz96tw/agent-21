#!/bin/bash

# Function to validate command line arguments
validate_arguments() {
  if [ "$#" -ne 3 ]; then
    echo "Usage: $0 operand1 operator operand2" >&2
    exit 1
  fi
}

# Function to perform calculations
perform_calculation() {
  local op1=
  local op=
  local op2=
  declare -i result

  case "$op" in
    "+") result=$((op1 + op2)) ;; 
    "-") result=$((op1 - op2)) ;; 
    "*") result=$((op1 * op2)) ;; 
    "/")
      if [ "$op2" -eq 0 ]; then
        echo "Error: Division by zero" >&2
        exit 1
      fi
      result=$((op1 / op2)) ;; 
    *)
      echo "Invalid operator" >&2
      exit 1
  esac
  echo "$result"
}

# Function to log the calculation history
log_history() {
  local expression="$1"
  local result="$2"
  
  # Check if history.txt is writable, create if necessary
  touch history.txt || { echo "Cannot write to history.txt" >&2; exit 1; }
  
  echo "$expression = $result" >> history.txt
}

# Main script execution
validate_arguments "$@"

operand1=$1
operator=$2
operand2=$3

result=$(perform_calculation "$operand1" "$operator" "$operand2")

# Log the result
log_history "$operand1 $operator $operand2" "$result"

# Output the result
echo "Result: $result"