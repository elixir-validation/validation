defmodule Validation.Rules.AlphanumericTest do
  use ExUnit.Case
  alias Validation.Rules.Alphanumeric, as: V
  doctest Validation

  test "valid alphanumeric" do
    assert {:ok} = V.validate("")
    assert {:ok} = V.validate("matheus")
    assert {:ok} = V.validate("gontijo")
    assert {:ok} = V.validate("gontijo123")
    assert {:ok} = V.validate("1")
    assert {:ok} = V.validate("a")
    assert {:ok} = V.validate("foobar")
  end

  test "valid alphanumeric with exclusion of characters" do
    assert {:ok} = V.validate("gontijo_", "_")
    assert {:ok} = V.validate("google.com", ".")
    assert {:ok} = V.validate("matheus gontijo", " ")
    assert {:ok} = V.validate("!@#$%^&*(){}abc123", "!@#$%^&*(){}")
    assert {:ok} = V.validate("[]?+=/\\-_|\",<>.abc123", "[]?+=/\\-_|\",<>.")
    assert {:ok} = V.validate("abc[]?+=/\\-_|\",<>. \t\n123", "[]?+=/\\-_|\",<>. \t\n")
    assert {:ok} = V.validate("a-1*d", "-*")
  end

  test "invalid alphanumeric" do
    assert {:error, _} = V.validate("number 100%")
    assert {:error, _} = V.validate("@#$")
    assert {:error, _} = V.validate("_")
    assert {:error, _} = V.validate("dgç")
    assert {:error, _} = V.validate("\t")
#    assert {:error, _} = V.validate("\n") @TODO: WHY IS BREAKLINE MATCHING?
    assert {:error, _} = V.validate("\nabc")
    assert {:error, _} = V.validate("\tdef")
    assert {:error, _} = V.validate("\nabc \t")
    assert {:error, _} = V.validate("matheus_gontijo")
  end

  test "invalid alphanumeric with exclusion of characters" do
    assert {:error, _} = V.validate("gontijo_", "$")
    assert {:error, _} = V.validate("google.com", "*")
    assert {:error, _} = V.validate("matheus gontijo", "_")
  end
end
