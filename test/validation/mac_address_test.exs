defmodule Validation.MacAddressTest do
  use ExUnit.Case
  doctest Validation

  test "valid mac address" do
    assert {:ok} = Validation.MacAddress.validate("00:11:22:33:44:55")
    assert {:ok} = Validation.MacAddress.validate("66-77-88-99-aa-bb")
    assert {:ok} = Validation.MacAddress.validate("AF:0F:bd:12:44:ba")
    assert {:ok} = Validation.MacAddress.validate("90-bc-d3-1a-dd-cc")
  end

  test "invalid mac address" do
    assert {:error, _} = Validation.MacAddress.validate("")
    assert {:error, _} = Validation.MacAddress.validate("00-1122:33:44:55")
  end
end
