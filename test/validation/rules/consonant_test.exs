defmodule Validation.Rules.ConsonantTest do
  use ExUnit.Case
  alias Validation.Rules.Consonant, as: V
  doctest Validation

  test "valid consonant" do
    assert {:ok} = V.validate("b")
    assert {:ok} = V.validate("c")
    assert {:ok} = V.validate("d")
    assert {:ok} = V.validate("w")
    assert {:ok} = V.validate("y")
    assert {:ok} = V.validate("qrst")
    assert {:ok} = V.validate("bcdfghklmnp")
  end

  test "valid consonant with exclusion of characters" do
    assert {:ok} = V.validate("wo", "o")
    assert {:ok} = V.validate("", "_")
    assert {:ok} = V.validate("_", "_")
    assert {:ok} = V.validate("bcdfghklm np", " ")
    assert {:ok} = V.validate("\nz\t", "\n\t")
    assert {:ok} = V.validate("www%", "%")
    assert {:ok} = V.validate("!@#$%^&*(){} bc dfg", "!@#$%^&*(){} ")
  end

  test "invalid consonant" do
    assert {:error, _} = V.validate("a")
    assert {:error, _} = V.validate("ul")
    assert {:error, _} = V.validate("aeiou")
    assert {:error, _} = V.validate("Foo")
    assert {:error, _} = V.validate("basic")
  end

  test "invalid consonant with exclusion of characters" do
    assert {:error, _} = V.validate("ou", "o")
    assert {:error, _} = V.validate("&_", "_")
    assert {:error, _} = V.validate("abcdfghklm np", " ")
    assert {:error, _} = V.validate("i\nz\t", "\n\t")
    assert {:error, _} = V.validate("wwwa%", "%")
    assert {:error, _} = V.validate("+!@#$%^&*(){} bc dfg", "!@#$%^&*(){} ")
    assert {:error, _} = V.validate("a+!@#$%^&*(){} bc dfg", "!@#$%^&*(){} ")
  end
end
