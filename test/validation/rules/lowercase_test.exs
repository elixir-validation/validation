defmodule Validation.Rules.LowercaseTest do
  use ExUnit.Case
  alias Validation.Rules.Lowercase, as: V
  doctest Validation

  test "valid lowercase" do
    assert V.validate?("")
    assert V.validate?("lowercase")
    assert V.validate?("lowercase-with-dashes")
    assert V.validate?("lowercase with spaces")
    assert V.validate?("lowercase with numbers 123")
    assert V.validate?("lowercase with specials characters like ã ç ê")
    assert V.validate?("with specials characters like # $ % & * +")
    assert V.validate?("τάχιστη αλώπηξ βαφής ψημένη γη, δρασκελίζει υπέρ νωθρού κυνός")
    assert V.validate?("42")
    assert V.validate?("!@#$%^")
  end

  test "invalid lowercase" do
    refute V.validate?("UPPERCASE")
    refute V.validate?("CamelCase")
    refute V.validate?("First Character Uppercase")
    refute V.validate?("With Numbers 1 2 3")
  end
end
