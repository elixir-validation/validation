defmodule Validation.Rules.SubdivisionCodeTest do
  use ExUnit.Case
  alias Validation.Rules.SubdivisionCode, as: V
  doctest Validation

  test "valid subdivision code" do
    assert V.validate?("US", "TX")
    assert V.validate?("BR", "SP")
    assert V.validate?("CA", "BC")
  end

  test "invalid subdivision code" do
    refute V.validate?("US", "AA")
    refute V.validate?("BR", "BB")
    refute V.validate?("CA", "CC")
  end

  test "exception - Invalid country code (ISO 3166 alpha-2)." do
    assert_raise RuntimeError, "Invalid country code (ISO 3166 alpha-2).", fn ->
      V.validate?("AAAA", "CA")
    end
  end
end
