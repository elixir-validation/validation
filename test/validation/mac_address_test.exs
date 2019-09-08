defmodule Validation.MacAddressTest do
  use ExUnit.Case
  alias Validation.MacAddress, as: V
  doctest Validation

  test "valid mac address" do
    assert {:ok} = V.validate("00:11:22:33:44:55")
    assert {:ok} = V.validate("66-77-88-99-aa-bb")
    assert {:ok} = V.validate("AF:0F:bd:12:44:ba")
    assert {:ok} = V.validate("90-bc-d3-1a-dd-cc")
  end

  test "invalid mac address" do
    assert {:error, _} = V.validate("")
    assert {:error, _} = V.validate("00-1122:33:44:55")
  end
end
