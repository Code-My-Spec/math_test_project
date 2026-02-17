defmodule MathTestProject.Calculator.Subtraction do
  @moduledoc """
  Subtracts two numbers and returns the result.
  """

  @doc """
  Subtracts the second number from the first and returns the difference.

  ## Examples

      iex> MathTestProject.Calculator.Subtraction.subtract(5, 3)
      2

      iex> MathTestProject.Calculator.Subtraction.subtract(10.0, 3.5)
      6.5

      iex> MathTestProject.Calculator.Subtraction.subtract(3, 5)
      -2
  """
  @spec subtract(number(), number()) :: number()
  def subtract(a, b) do
    a - b
  end
end
