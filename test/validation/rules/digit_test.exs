defmodule Validation.Rules.DigitTest do
  use ExUnit.Case
  alias Validation.Rules.Digit, as: V
  doctest Validation

  test "valid digit" do
    assert {:ok} = V.validate("165")
    assert {:ok} = V.validate("01650")
    assert {:ok} = V.validate("01")
  end

  test "valid digit with exclusion of characters" do
    assert {:ok} = V.validate("1.0", ".")
    assert {:ok} = V.validate("16-50", "-")
    assert {:ok} = V.validate("16-5.0", "-.")
    assert {:ok} = V.validate("!@#$%^8&*(){}", "!@#$%^&*(){}")
    assert {:ok} = V.validate("012.071.070-69", "-.")
  end

  test "invalid digit" do
    assert {:error, _} = V.validate("")
    assert {:error, _} = V.validate("-1.1")
    assert {:error, _} = V.validate("-12")
    assert {:error, _} = V.validate("1.0")
    assert {:error, _} = V.validate("16 50")
    assert {:error, _} = V.validate("16-50")
    assert {:error, _} = V.validate("1\n1")
    assert {:error, _} = V.validate("1\t1")
    assert {:error, _} = V.validate("a")
    assert {:error, _} = V.validate("a1")
  end

  test "invalid digit with exclusion of characters" do
    assert {:error, _} = V.validate("1.%0", ".")
    assert {:error, _} = V.validate("16-a50", "-")
    assert {:error, _} = V.validate("3333316-5.0/", "-.")
  end
end
