defmodule Validation.Rules.UppercaseTest do
  use ExUnit.Case
  alias Validation.Rules.Uppercase, as: V
  doctest Validation

  test "valid uppercase" do
    assert {:ok} = V.validate("")
    assert {:ok} = V.validate("UPPERCASE")
    assert {:ok} = V.validate("UPPERCASE-WITH-DASHES")
    assert {:ok} = V.validate("UPPERCASE WITH SPACES")
    assert {:ok} = V.validate("UPPERCASE WITH NUMBERS 123")
    assert {:ok} = V.validate("UPPERCASE WITH SPECIALS CHARACTERS LIKE Ã Ç Ê")
    assert {:ok} = V.validate("WITH SPECIALS CHARACTERS LIKE # $ % & * +")
    assert {:ok} = V.validate("ΤΆΧΙΣΤΗ ΑΛΏΠΗΞ ΒΑΦΉΣ ΨΗΜΈΝΗ ΓΗ, ΔΡΑΣΚΕΛΊΖΕΙ ΥΠΈΡ ΝΩΘΡΟΎ ΚΥΝΌΣ")
    assert {:ok} = V.validate("42")
    assert {:ok} = V.validate("!@#$%^")
  end

  test "invalid uppercase" do
    assert {:error, _} = V.validate("lowercase")
    assert {:error, _} = V.validate("CamelCase")
    assert {:error, _} = V.validate("First Character Uppercase")
    assert {:error, _} = V.validate("With Numbers 1 2 3")
  end
end
