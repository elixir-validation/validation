defmodule Validation.Rules.OddTest do
  use ExUnit.Case
  alias Validation.Rules.Odd, as: V
  doctest Validation

  test "valid odd" do
    assert {:ok} = V.validate(1)
    assert {:ok} = V.validate(3)
    assert {:ok} = V.validate(5)
    assert {:ok} = V.validate(-1)
    assert {:ok} = V.validate(9999999)
  end

  test "invalid odd" do
    assert {:error, _} = V.validate(0)
    assert {:error, _} = V.validate(2)
    assert {:error, _} = V.validate(4)
    assert {:error, _} = V.validate(100)
    assert {:error, _} = V.validate(-2)
    assert {:error, _} = V.validate(9999998)
  end
end
