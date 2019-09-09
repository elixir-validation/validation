defmodule Validation.Rules.LowercaseTest do
  use ExUnit.Case
  alias Validation.Rules.Lowercase, as: V
  doctest Validation

  test "valid lowercase" do
    assert {:ok} = V.validate("")
    assert {:ok} = V.validate("lowercase")
    assert {:ok} = V.validate("lowercase-with-dashes")
    assert {:ok} = V.validate("lowercase with spaces")
    assert {:ok} = V.validate("lowercase with numbers 123")
    assert {:ok} = V.validate("lowercase with specials characters like ã ç ê")
    assert {:ok} = V.validate("with specials characters like # $ % & * +")
    assert {:ok} = V.validate("τάχιστη αλώπηξ βαφής ψημένη γη, δρασκελίζει υπέρ νωθρού κυνός")
    assert {:ok} = V.validate("42")
    assert {:ok} = V.validate("!@#$%^")
  end

  test "invalid lowercase" do
    assert {:error, _} = V.validate("UPPERCASE")
    assert {:error, _} = V.validate("CamelCase")
    assert {:error, _} = V.validate("First Character Uppercase")
    assert {:error, _} = V.validate("With Numbers 1 2 3")
  end
end
