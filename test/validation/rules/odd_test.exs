defmodule Validation.Rules.OddTest do
  use ExUnit.Case
  alias Validation.Rules.Odd, as: V
  doctest Validation

  test "valid odd" do
    assert V.validate?(1)
    assert V.validate?(3)
    assert V.validate?(5)
    assert V.validate?(-1)
    assert V.validate?(9999999)
  end

  test "invalid odd" do
    refute V.validate?(0)
    refute V.validate?(2)
    refute V.validate?(4)
    refute V.validate?(100)
    refute V.validate?(-2)
    refute V.validate?(9999998)
  end
end
