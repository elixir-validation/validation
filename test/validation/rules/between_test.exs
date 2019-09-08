defmodule Validation.Rules.BetweenTest do
  use ExUnit.Case
  alias Validation.Rules.Between, as: V
  doctest Validation

  test "valid ranges - digits" do
    assert {:ok} = V.validate(11, 10, 20)
    assert {:ok} = V.validate(10, 10, 20)
    assert {:ok} = V.validate(20, 10, 20)
    assert {:ok} = V.validate(-11, -20, -10)
    assert {:ok} = V.validate(0, 0, 0)
    assert {:ok} = V.validate(10, 10, 10)
  end

  test "valid ranges - letters" do
    assert {:ok} = V.validate("b", "a", "c")
    assert {:ok} = V.validate("b", "a", "z")
    assert {:ok} = V.validate("u", "c", "y")
    assert {:ok} = V.validate("a", "a", "a")
    assert {:ok} = V.validate("z", "z", "z")
    assert {:ok} = V.validate("a", "a", "z")
    assert {:ok} = V.validate("B", "A", "Z")
  end

  test "invalid mac address - digits" do
    assert {:error, _} = V.validate(99, 10, 20)
    assert {:error, _} = V.validate(88, 10, 20)
    assert {:error, _} = V.validate(-99, -20, -10)
  end

  test "invalid ranges - letters" do
    assert {:error, _} = V.validate("b", "t", "u")
    assert {:error, _} = V.validate("a", "z", "z")
    assert {:error, _} = V.validate("A", "Z", "Z")
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
