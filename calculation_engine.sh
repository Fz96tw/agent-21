# Calculation Engine Script

# Start of the Calculation Engine
result=""

# Input operands and operator
operand1=5
operand2=10
operator=+

# Implementing the calculation using case statement
case "$operator" in
    +)
        result=$((operand1 + operand2))
        ;;
    -)
        result=$((operand1 - operand2))
        ;;
    *)
        result=$((operand1 * operand2))
        ;;
    /)
        if [ "$operand2" -eq 0 ]; then
            echo "Error: Division by zero"
            exit 1
        else
            result=$((operand1 / operand2))
        fi
        ;;
    *)
        echo "Error: Invalid operator"
        exit 1
        ;;
esac

# Output the result
echo "Result: $result"