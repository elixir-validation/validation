defmodule Validation.Rules.EvenTest do
  use ExUnit.Case
  alias Validation.Rules.Even, as: V
  doctest Validation

  test "valid even" do
    assert {:ok} = V.validate(0)
    assert {:ok} = V.validate(2)
    assert {:ok} = V.validate(4)
    assert {:ok} = V.validate(100)
    assert {:ok} = V.validate(-2)
    assert {:ok} = V.validate(9999998)
  end

  test "invalid even" do
    assert {:error, _} = V.validate(1)
    assert {:error, _} = V.validate(3)
    assert {:error, _} = V.validate(5)
    assert {:error, _} = V.validate(-1)
    assert {:error, _} = V.validate(9999999)
  end
end
