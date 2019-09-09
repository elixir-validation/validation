defmodule Validation.Rules.AlphaTest do
  use ExUnit.Case
  alias Validation.Rules.Alpha, as: V
  doctest Validation

  test "valid alpha" do
    assert {:ok} = V.validate("")
    assert {:ok} = V.validate("matheus")
    assert {:ok} = V.validate("gontijo")
    assert {:ok} = V.validate("a")
    assert {:ok} = V.validate("foobar")
  end

  test "valid with exclusion of characters" do
    assert {:ok} = V.validate("gontijo_", "_")
    assert {:ok} = V.validate("google.com", ".")
    assert {:ok} = V.validate("matheus gontijo", " ")
    assert {:ok} = V.validate("!@#$%^&*(){}abc", "!@#$%^&*(){}")
    assert {:ok} = V.validate("[]?+=/\\-_|\",<>.abc", "[]?+=/\\-_|\",<>.")
    assert {:ok} = V.validate("abc[]?+=/\\-_|\",<>. \t\n", "[]?+=/\\-_|\",<>. \t\n")
    assert {:ok} = V.validate("a-123*d", "123-*")
  end

  test "invalid alpha" do
    assert {:error, _} = V.validate("123")
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

  test "invalid with exclusion of characters" do
    assert {:error, _} = V.validate("gontijo_123", "$")
    assert {:error, _} = V.validate("google.com321", "*")
    assert {:error, _} = V.validate("matheus gontijo1", "_")
  end
end
