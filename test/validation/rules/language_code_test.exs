defmodule Validation.Rules.LanguageCodeTest do
  use ExUnit.Case
  alias Validation.Rules.LanguageCode, as: V
  doctest Validation

  test "valid language code" do
    assert V.validate("en",  :alpha2)
    assert V.validate("it",  :alpha2)
    assert V.validate("la",  :alpha2)
    assert V.validate("pt",  :alpha2)
    assert V.validate("eng", :alpha3)
    assert V.validate("ita", :alpha3)
    assert V.validate("lat", :alpha3)
    assert V.validate("por", :alpha3)
  end

  test "invalid language code" do
    refute V.validate("por", :alpha2)
    refute V.validate("",    :alpha2)
    refute V.validate("pt",  :alpha3)
    refute V.validate("",    :alpha3)
  end

  test "exception - Invalid type param. It should be either: :alpha2 or :alpha3." do
    assert_raise RuntimeError, "Invalid type param. It should be either: :alpha2 or :alpha3.", fn ->
      V.validate("pt", :unknown_type)
    end
  end
end
