defmodule MathTestProject.Calculator.AdditionTest do
  use MathTestProject.DataCase, async: true

  alias MathTestProject.Calculator.Addition

  describe "add/2" do
    test "returns the sum of two positive integers" do
      assert Addition.add(2, 3) == 5
      assert Addition.add(10, 20) == 30
      assert Addition.add(1, 1) == 2
    end

    test "returns the sum of two negative integers" do
      assert Addition.add(-2, -3) == -5
      assert Addition.add(-10, -20) == -30
      assert Addition.add(-1, -1) == -2
    end

    test "returns the sum of a positive and negative integer" do
      assert Addition.add(5, -3) == 2
      assert Addition.add(-5, 3) == -2
      assert Addition.add(10, -10) == 0
      assert Addition.add(-7, 15) == 8
    end

    test "handles floating point numbers correctly" do
      assert Addition.add(1.5, 2.5) == 4.0
      assert Addition.add(3.14, 2.86) == 6.0
      assert Addition.add(-1.5, 1.5) == 0.0
      assert Addition.add(0.1, 0.2) == 0.30000000000000004
    end

    test "returns zero when adding zero to any number" do
      assert Addition.add(0, 0) == 0
      assert Addition.add(0, 5) == 5
      assert Addition.add(5, 0) == 5
      assert Addition.add(0, -5) == -5
      assert Addition.add(-5, 0) == -5
      assert Addition.add(0, 3.14) == 3.14
    end
  end
end
