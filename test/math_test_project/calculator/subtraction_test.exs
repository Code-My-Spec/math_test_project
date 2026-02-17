defmodule MathTestProject.Calculator.SubtractionTest do
  use MathTestProject.DataCase, async: true

  alias MathTestProject.Calculator.Subtraction

  describe "subtract/2" do
    test "returns the difference of two positive integers" do
      assert Subtraction.subtract(5, 3) == 2
      assert Subtraction.subtract(10, 4) == 6
      assert Subtraction.subtract(20, 8) == 12
      assert Subtraction.subtract(100, 50) == 50
    end

    test "returns the difference of two negative integers" do
      assert Subtraction.subtract(-5, -3) == -2
      assert Subtraction.subtract(-10, -4) == -6
      assert Subtraction.subtract(-20, -30) == 10
      assert Subtraction.subtract(-1, -1) == 0
    end

    test "handles subtraction resulting in negative numbers" do
      assert Subtraction.subtract(3, 5) == -2
      assert Subtraction.subtract(10, 20) == -10
      assert Subtraction.subtract(0, 15) == -15
      assert Subtraction.subtract(-5, 10) == -15
    end

    test "handles floating point numbers correctly" do
      assert Subtraction.subtract(5.5, 2.5) == 3.0
      assert Subtraction.subtract(10.0, 3.5) == 6.5
      assert Subtraction.subtract(3.14, 2.14) == 1.0
      assert Subtraction.subtract(-1.5, 1.5) == -3.0
    end

    test "returns the original number when subtracting zero" do
      assert Subtraction.subtract(0, 0) == 0
      assert Subtraction.subtract(5, 0) == 5
      assert Subtraction.subtract(-5, 0) == -5
      assert Subtraction.subtract(3.14, 0) == 3.14
      assert Subtraction.subtract(0.0, 0.0) == 0.0
    end
  end
end
