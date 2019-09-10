defmodule Validation.Rules.CreditCardTest do
  use ExUnit.Case
  alias Validation.Rules.CreditCard, as: V
  doctest Validation

  test "valid credit card" do
    assert V.validate("5555444433331111")
    assert V.validate("5376 7473 9720 8720")
    assert V.validate("2223000048400011")
    assert V.validate("2222 4000 4124 0011")
    assert V.validate("4024.0071.5336.1885")
    assert V.validate("4024 007 193 879")
    assert V.validate("340-3161-9380-9364")
    assert V.validate("30351042633884")
    assert V.validate("6011000990139424")
    assert V.validate("3566002020360505")
  end

  test "invalid credit card" do
    refute V.validate("")
    refute V.validate("it isnt my credit c)ard number")
    refute V.validate("&stR@ng3|) (|-|@r$")
    refute V.validate("1234 1234 1234 1234")
    refute V.validate("1234.1234.1234.12)34")
  end
end
