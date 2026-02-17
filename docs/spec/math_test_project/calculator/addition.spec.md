# MathTestProject.Calculator.Addition

Adds two numbers and returns the result

## Type

module

## Dependencies

- None

## Functions

### add/2

Adds two numbers and returns their sum.

```elixir
@spec add(number(), number()) :: number()
```

**Process**:
1. Accept two numbers as arguments
2. Add them together using the `+` operator
3. Return the result

**Test Assertions**:
- returns the sum of two positive integers
- returns the sum of two negative integers
- returns the sum of a positive and negative integer
- handles floating point numbers correctly
- returns zero when adding zero to any number
