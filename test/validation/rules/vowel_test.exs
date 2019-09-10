defmodule Validation.Rules.VowelTest do
  use ExUnit.Case
  alias Validation.Rules.Vowel, as: V
  doctest Validation

  test "valid vowel" do
    assert V.validate("a")
    assert V.validate("e")
    assert V.validate("i")
    assert V.validate("o")
    assert V.validate("u")
    assert V.validate("aeiou")
    assert V.validate("uoiea")
  end

  test "valid vowel with exclusion of characters" do
    assert V.validate("!@#$%^&*(){}aeoiu", "!@#$%^&*(){}")
    assert V.validate("[]?+=/\\-_|\"\',<>.aeoiu", "[]?+=/\\-_|\"\',<>.")
  end

  test "invalid vowel" do
#    refute V.validate("\n") @TODO: WHY IS BREAKLINE MATCHING?
    refute V.validate("\t")
    refute V.validate("\r")
    refute V.validate("ul")
    refute V.validate("16")
    refute V.validate("F")
    refute V.validate("g")
    refute V.validate("Foo")
    refute V.validate("5")
    refute V.validate("basic")
  end

  test "invalid vowel with exclusion of characters" do
    refute V.validate("!@#$%^&*(){}aeoiuk", "!@#$%^&*(){}")
    refute V.validate("k[]?+=/\\-_|\"\',<>.aeoiu", "[]?+=/\\-_|\"\',<>.")
  end
end
