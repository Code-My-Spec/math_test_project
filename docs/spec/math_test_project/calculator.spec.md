# MathTestProject.Calculator

Performs arithmetic operations on numbers

## Type

context

## Delegates

- add/2: MathTestProject.Calculator.Addition.add/2
- subtract/2: MathTestProject.Calculator.Subtraction.subtract/2

## Functions

### add/2

Adds two numbers and returns their sum.

```elixir
@spec add(number(), number()) :: number()
```

**Process**:
1. Delegate to MathTestProject.Calculator.Addition.add/2
2. Return the result

**Test Assertions**:
- returns the sum of two positive integers
- returns the sum of two negative integers
- returns the sum of a positive and negative integer
- handles floating point numbers correctly
- returns zero when adding zero to any number

### subtract/2

Subtracts the second number from the first and returns the difference.

```elixir
@spec subtract(number(), number()) :: number()
```

**Process**:
1. Delegate to MathTestProject.Calculator.Subtraction.subtract/2
2. Return the result

**Test Assertions**:
- returns the difference of two positive integers
- returns the difference of two negative integers
- handles subtraction resulting in negative numbers
- handles floating point numbers correctly
- returns the original number when subtracting zero

## Dependencies

- MathTestProject.Calculator.Addition
- MathTestProject.Calculator.Subtraction

## Components

### MathTestProject.Calculator.Addition

Adds two numbers and returns the result

### MathTestProject.Calculator.Subtraction

Subtracts two numbers and returns the result
