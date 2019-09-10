defmodule Validation.Rules.EvenTest do
  use ExUnit.Case
  alias Validation.Rules.Even, as: V
  doctest Validation

  test "valid even" do
    assert V.validate(0)
    assert V.validate(2)
    assert V.validate(4)
    assert V.validate(100)
    assert V.validate(-2)
    assert V.validate(9999998)
  end

  test "invalid even" do
    refute V.validate(1)
    refute V.validate(3)
    refute V.validate(5)
    refute V.validate(-1)
    refute V.validate(9999999)
  end
end
