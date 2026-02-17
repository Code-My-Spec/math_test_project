# MathTestProject.Calculator.Subtraction

Subtracts two numbers and returns the result

## Type

module

## Dependencies

- None

## Functions

### subtract/2

Subtracts the second number from the first and returns the difference.

```elixir
@spec subtract(number(), number()) :: number()
```

**Process**:
1. Accept two numbers as arguments
2. Subtract the second from the first using the `-` operator
3. Return the result

**Test Assertions**:
- returns the difference of two positive integers
- returns the difference of two negative integers
- handles subtraction resulting in negative numbers
- handles floating point numbers correctly
- returns the original number when subtracting zero
