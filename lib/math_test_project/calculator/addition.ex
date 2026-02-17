defmodule MathTestProject.Calculator.Addition do
  @moduledoc """
  Adds two numbers and returns the result.

  This module provides a simple addition function that accepts two numbers
  (integers or floats) and returns their sum.
  """

  @doc """
  Adds two numbers and returns their sum.

  ## Parameters

    - `a` - The first number (integer or float)
    - `b` - The second number (integer or float)

  ## Returns

  The sum of `a` and `b` as a number.

  ## Examples

      iex> MathTestProject.Calculator.Addition.add(2, 3)
      5

      iex> MathTestProject.Calculator.Addition.add(1.5, 2.5)
      4.0

      iex> MathTestProject.Calculator.Addition.add(-5, 3)
      -2

      iex> MathTestProject.Calculator.Addition.add(0, 10)
      10

  """
  @spec add(number(), number()) :: number()
  def add(a, b) do
    a + b
  end
end
