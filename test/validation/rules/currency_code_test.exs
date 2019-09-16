defmodule Validation.Rules.CurrencyCodeTest do
  use ExUnit.Case
  alias Validation.Rules.CurrencyCode, as: V
  doctest Validation

  test "valid currency code" do
    assert V.validate?("EUR")
    assert V.validate?("GBP")
    assert V.validate?("XAU")
    assert V.validate?("XBA")
    assert V.validate?("XXX")
  end

  test "invalid currency code" do
    refute V.validate?("BTC")
    refute V.validate?("GGP")
    refute V.validate?("USA")
    refute V.validate?("xxx")
  end
end
