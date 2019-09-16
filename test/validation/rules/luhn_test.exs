defmodule Validation.Rules.LuhnTest do
  use ExUnit.Case
  alias Validation.Rules.Luhn, as: V
  doctest Validation

  test "valid luhn" do
    assert V.validate?("9773725370")
    assert V.validate?("2222400041240011")
    assert V.validate?("340316193809364")
    assert V.validate?("6011000990139424")
  end

  test "invalid luhn" do
    refute V.validate?("")
    refute V.validate?("true")
    refute V.validate?("2222400041240021")
    refute V.validate?("340316193809334")
    refute V.validate?("8888888888888887")
  end
end
