defmodule Validation.Rules.CountryCodeTest do
  use ExUnit.Case
  alias Validation.Rules.CountryCode, as: V
  doctest Validation

  test "valid country code" do
    assert V.validate?("BR",  :alpha2)
    assert V.validate?("BRA", :alpha3)
    assert V.validate?("076", :numeric)
    assert V.validate?("DE",  :alpha2)
    assert V.validate?("DEU", :alpha3)
    assert V.validate?("276", :numeric)
    assert V.validate?("US",  :alpha2)
    assert V.validate?("USA", :alpha3)
    assert V.validate?("840", :numeric)
  end

  test "invalid country code" do
    refute V.validate?("", :alpha2)
    refute V.validate?("USA", :alpha2)
    refute V.validate?("US",  :alpha3)
    refute V.validate?("000", :numeric)
  end

  test "exception - Invalid type param. It should be either: :alpha2, :alpha3 or :numeric." do
    assert_raise RuntimeError, "Invalid type param. It should be either: :alpha2, :alpha3 or :numeric.", fn ->
      V.validate?("BR", :unknown_type)
    end
  end
end
