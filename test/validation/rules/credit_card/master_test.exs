defmodule Validation.Rules.CreditCard.MasterTest do
  use ExUnit.Case
  alias Validation.Rules.CreditCard.Master, as: V
  doctest Validation

  test "invalid credit card - master" do
    assert {:ok} = V.validate("2222 4000 4124 0011")
    assert {:ok} = V.validate("5376 7473 9720 8720")
  end

  test "invalid credit card - visa" do
    assert {:error, _} = V.validate("340-3161-9380-9364")   # amex
    assert {:error, _} = V.validate("6011000990139424")     # discover
    assert {:error, _} = V.validate("30351042633884")       # diners
    assert {:error, _} = V.validate("3566002020360505")     # jcb
    assert {:error, _} = V.validate("4024.0071.5336.1885")  # visa
    assert {:error, _} = V.validate("4024 007 193 879")     # visa
  end
end
