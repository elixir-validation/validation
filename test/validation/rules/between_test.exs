defmodule Validation.Rules.BetweenTest do
  use ExUnit.Case
  alias Validation.Rules.Between, as: V
  doctest Validation

  test "valid ranges - digits" do
    assert V.validate(11, 10, 20)
    assert V.validate(10, 10, 20)
    assert V.validate(20, 10, 20)
    assert V.validate(-11, -20, -10)
    assert V.validate(0, 0, 0)
    assert V.validate(10, 10, 10)
  end

  test "valid ranges - letters" do
    assert V.validate("b", "a", "c")
    assert V.validate("b", "a", "z")
    assert V.validate("u", "c", "y")
    assert V.validate("a", "a", "a")
    assert V.validate("z", "z", "z")
    assert V.validate("a", "a", "z")
    assert V.validate("B", "A", "Z")
  end

  test "invalid mac address - digits" do
    refute V.validate(99, 10, 20)
    refute V.validate(88, 10, 20)
    refute V.validate(-99, -20, -10)
  end

  test "invalid ranges - letters" do
    refute V.validate("b", "t", "u")
    refute V.validate("a", "z", "z")
    refute V.validate("A", "Z", "Z")
  end

  test "exception - Minimum param can't be greater than maximum param." do
    assert_raise RuntimeError, "Minimum param can't be greater than maximum param.", fn ->
      V.validate(0, 20, 10)
      V.validate("a", "z", "a")
    end
  end

  test "exception - Minimum param has to be a single letter." do
    assert_raise RuntimeError, "Minimum param has to be a single letter.", fn ->
      V.validate("a", "abc", "a")
    end
  end

  test "exception - Maximum param has to be a single letter." do
    assert_raise RuntimeError, "Maximum param has to be a single letter.", fn ->
      V.validate("a", "a", "abc")
    end
  end
end
