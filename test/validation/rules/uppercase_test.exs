defmodule Validation.Rules.UppercaseTest do
  use ExUnit.Case
  alias Validation.Rules.Uppercase, as: V
  doctest Validation

  test "valid uppercase" do
    assert V.validate?("")
    assert V.validate?("UPPERCASE")
    assert V.validate?("UPPERCASE-WITH-DASHES")
    assert V.validate?("UPPERCASE WITH SPACES")
    assert V.validate?("UPPERCASE WITH NUMBERS 123")
    assert V.validate?("UPPERCASE WITH SPECIALS CHARACTERS LIKE Ã Ç Ê")
    assert V.validate?("WITH SPECIALS CHARACTERS LIKE # $ % & * +")
    assert V.validate?("ΤΆΧΙΣΤΗ ΑΛΏΠΗΞ ΒΑΦΉΣ ΨΗΜΈΝΗ ΓΗ, ΔΡΑΣΚΕΛΊΖΕΙ ΥΠΈΡ ΝΩΘΡΟΎ ΚΥΝΌΣ")
    assert V.validate?("42")
    assert V.validate?("!@#$%^")
  end

  test "invalid uppercase" do
    refute V.validate?("lowercase")
    refute V.validate?("CamelCase")
    refute V.validate?("First Character Uppercase")
    refute V.validate?("With Numbers 1 2 3")
  end
end
