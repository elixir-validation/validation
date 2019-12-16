defmodule Validation.Rules.CreditCard.VisaTest do
  use ExUnit.Case
  alias Validation.Rules.CreditCard.Visa, as: V
  doctest Validation

  test "valid credit card - visa" do
    assert V.validate?("4024 007 193 879")
    assert V.validate?("4024.0071.5336.1885")
  end

  test "invalid credit card - visa" do
    # amex
    refute V.validate?("340-3161-9380-9364")
    # discover
    refute V.validate?("6011000990139424")
    # diners
    refute V.validate?("30351042633884")
    # jcb
    refute V.validate?("3566002020360505")
    # master
    refute V.validate?("5376 7473 9720 8720")
    # master
    refute V.validate?("2222 4000 4124 0011")
  end
end
