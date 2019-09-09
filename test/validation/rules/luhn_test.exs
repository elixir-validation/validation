defmodule Validation.Rules.LuhnTest do
  use ExUnit.Case
  alias Validation.Rules.Luhn, as: V
  doctest Validation

  test "valid luhn" do
    assert {:ok} = V.validate("2222400041240011")
    assert {:ok} = V.validate("340316193809364")
    assert {:ok} = V.validate("6011000990139424")
  end

  test "invalid luhn" do
    assert {:error, _} = V.validate("")
    assert {:error, _} = V.validate("2222400041240021")
    assert {:error, _} = V.validate("340316193809334")
    assert {:error, _} = V.validate("222240004124001.1")
    assert {:error, _} = V.validate("2222400041240011]")
    assert {:error, _} = V.validate("true")
  end
end
