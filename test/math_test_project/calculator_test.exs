defmodule MathTestProject.CalculatorTest do
  use MathTestProject.DataCase, async: true

  alias MathTestProject.Calculator

  describe "add/2" do
    test "returns the sum of two positive integers" do
      assert Calculator.add(2, 3) == 5
      assert Calculator.add(10, 20) == 30
      assert Calculator.add(1, 1) == 2
    end

    test "returns the sum of two negative integers" do
      assert Calculator.add(-2, -3) == -5
      assert Calculator.add(-10, -20) == -30
      assert Calculator.add(-1, -1) == -2
    end

    test "returns the sum of a positive and negative integer" do
      assert Calculator.add(5, -3) == 2
      assert Calculator.add(-5, 3) == -2
      assert Calculator.add(10, -10) == 0
      assert Calculator.add(-7, 15) == 8
    end

    test "handles floating point numbers correctly" do
      assert Calculator.add(1.5, 2.5) == 4.0
      assert Calculator.add(3.14, 2.86) == 6.0
      assert Calculator.add(-1.5, 1.5) == 0.0
      assert Calculator.add(0.1, 0.2) == 0.30000000000000004
    end

    test "returns zero when adding zero to any number" do
      assert Calculator.add(0, 0) == 0
      assert Calculator.add(0, 5) == 5
      assert Calculator.add(5, 0) == 5
      assert Calculator.add(0, -5) == -5
      assert Calculator.add(-5, 0) == -5
      assert Calculator.add(0, 3.14) == 3.14
    end
  end

  describe "subtract/2" do
    test "returns the difference of two positive integers" do
      assert Calculator.subtract(5, 3) == 2
      assert Calculator.subtract(10, 4) == 6
      assert Calculator.subtract(20, 8) == 12
      assert Calculator.subtract(100, 50) == 50
    end

    test "returns the difference of two negative integers" do
      assert Calculator.subtract(-5, -3) == -2
      assert Calculator.subtract(-10, -4) == -6
      assert Calculator.subtract(-20, -30) == 10
      assert Calculator.subtract(-1, -1) == 0
    end

    test "handles subtraction resulting in negative numbers" do
      assert Calculator.subtract(3, 5) == -2
      assert Calculator.subtract(10, 20) == -10
      assert Calculator.subtract(0, 15) == -15
      assert Calculator.subtract(-5, 10) == -15
    end

    test "handles floating point numbers correctly" do
      assert Calculator.subtract(5.5, 2.5) == 3.0
      assert Calculator.subtract(10.0, 3.5) == 6.5
      assert Calculator.subtract(3.14, 2.14) == 1.0
      assert Calculator.subtract(-1.5, 1.5) == -3.0
    end

    test "returns the original number when subtracting zero" do
      assert Calculator.subtract(0, 0) == 0
      assert Calculator.subtract(5, 0) == 5
      assert Calculator.subtract(-5, 0) == -5
      assert Calculator.subtract(3.14, 0) == 3.14
      assert Calculator.subtract(0.0, 0.0) == 0.0
    end
  end
end
