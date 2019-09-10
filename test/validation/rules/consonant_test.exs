defmodule Validation.Rules.ConsonantTest do
  use ExUnit.Case
  alias Validation.Rules.Consonant, as: V
  doctest Validation

  test "valid consonant" do
    assert V.validate("b")
    assert V.validate("c")
    assert V.validate("d")
    assert V.validate("w")
    assert V.validate("y")
    assert V.validate("qrst")
    assert V.validate("bcdfghklmnp")
  end

  test "valid consonant with exclusion of characters" do
    assert V.validate("wo", "o")
    assert V.validate("", "_")
    assert V.validate("_", "_")
    assert V.validate("bcdfghklm np", " ")
    assert V.validate("\nz\t", "\n\t")
    assert V.validate("www%", "%")
    assert V.validate("!@#$%^&*(){} bc dfg", "!@#$%^&*(){} ")
  end

  test "invalid consonant" do
    refute V.validate("a")
    refute V.validate("ul")
    refute V.validate("aeiou")
    refute V.validate("Foo")
    refute V.validate("basic")
  end

  test "invalid consonant with exclusion of characters" do
    refute V.validate("ou", "o")
    refute V.validate("&_", "_")
    refute V.validate("abcdfghklm np", " ")
    refute V.validate("i\nz\t", "\n\t")
    refute V.validate("wwwa%", "%")
    refute V.validate("+!@#$%^&*(){} bc dfg", "!@#$%^&*(){} ")
    refute V.validate("a+!@#$%^&*(){} bc dfg", "!@#$%^&*(){} ")
  end
end
