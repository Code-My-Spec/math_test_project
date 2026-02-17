defmodule MathTestProject.Calculator do
  @moduledoc """
  Performs arithmetic operations on numbers.

  This module serves as the main API for calculator operations, delegating
  to specialized modules for each operation type.
  """

  alias MathTestProject.Calculator.Addition
  alias MathTestProject.Calculator.Subtraction

  @doc """
  Adds two numbers and returns their sum.

  Delegates to `MathTestProject.Calculator.Addition.add/2`.

  ## Parameters

    - `a` - The first number (integer or float)
    - `b` - The second number (integer or float)

  ## Returns

  The sum of `a` and `b` as a number.

  ## Examples

      iex> MathTestProject.Calculator.add(2, 3)
      5

      iex> MathTestProject.Calculator.add(1.5, 2.5)
      4.0

      iex> MathTestProject.Calculator.add(-5, 3)
      -2

  """
  @spec add(number(), number()) :: number()
  defdelegate add(a, b), to: Addition

  @doc """
  Subtracts the second number from the first and returns the difference.

  Delegates to `MathTestProject.Calculator.Subtraction.subtract/2`.

  ## Parameters

    - `a` - The first number (integer or float)
    - `b` - The second number to subtract from the first (integer or float)

  ## Returns

  The difference of `a` minus `b` as a number.

  ## Examples

      iex> MathTestProject.Calculator.subtract(5, 3)
      2

      iex> MathTestProject.Calculator.subtract(10.0, 3.5)
      6.5

      iex> MathTestProject.Calculator.subtract(3, 5)
      -2

  """
  @spec subtract(number(), number()) :: number()
  defdelegate subtract(a, b), to: Subtraction
end
