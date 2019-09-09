defmodule Validation.Rules.VowelTest do
  use ExUnit.Case
  alias Validation.Rules.Vowel, as: V
  doctest Validation

  test "valid vowel" do
    assert {:ok} = V.validate("a")
    assert {:ok} = V.validate("e")
    assert {:ok} = V.validate("i")
    assert {:ok} = V.validate("o")
    assert {:ok} = V.validate("u")
    assert {:ok} = V.validate("aeiou")
    assert {:ok} = V.validate("uoiea")
  end

  test "valid vowel with exclusion of characters" do
    assert {:ok} = V.validate("!@#$%^&*(){}aeoiu", "!@#$%^&*(){}")
    assert {:ok} = V.validate("[]?+=/\\-_|\"\',<>.aeoiu", "[]?+=/\\-_|\"\',<>.")
  end

  test "invalid vowel" do
#    assert {:error, _} = V.validate("\n") @TODO: WHY IS BREAKLINE MATCHING?
    assert {:error, _} = V.validate("\t")
    assert {:error, _} = V.validate("\r")
    assert {:error, _} = V.validate("ul")
    assert {:error, _} = V.validate("16")
    assert {:error, _} = V.validate("F")
    assert {:error, _} = V.validate("g")
    assert {:error, _} = V.validate("Foo")
    assert {:error, _} = V.validate("5")
    assert {:error, _} = V.validate("basic")
  end

  test "invalid vowel with exclusion of characters" do
    assert {:error, _} = V.validate("!@#$%^&*(){}aeoiuk", "!@#$%^&*(){}")
    assert {:error, _} = V.validate("k[]?+=/\\-_|\"\',<>.aeoiu", "[]?+=/\\-_|\"\',<>.")
  end
end
