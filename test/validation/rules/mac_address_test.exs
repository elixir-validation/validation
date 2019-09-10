defmodule Validation.Rules.MacAddressTest do
  use ExUnit.Case
  alias Validation.Rules.MacAddress, as: V
  doctest Validation

  test "valid mac address" do
    assert V.validate("00:11:22:33:44:55")
    assert V.validate("66-77-88-99-aa-bb")
    assert V.validate("AF:0F:bd:12:44:ba")
    assert V.validate("90-bc-d3-1a-dd-cc")
  end

  test "invalid mac address" do
    refute V.validate("")
    refute V.validate("00-1122:33:44:55")
  end
end
