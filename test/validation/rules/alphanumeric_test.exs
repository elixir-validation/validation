defmodule Validation.Rules.AlphanumericTest do
  use ExUnit.Case
  alias Validation.Rules.Alphanumeric, as: V
  doctest Validation

  test "valid alphanumeric" do
    assert V.validate?("")
    assert V.validate?("matheus")
    assert V.validate?("gontijo")
    assert V.validate?("gontijo123")
    assert V.validate?("1")
    assert V.validate?("a")
    assert V.validate?("foobar")
  end

  test "valid alphanumeric with exclusion of characters" do
    assert V.validate?("gontijo_", "_")
    assert V.validate?("google.com", ".")
    assert V.validate?("matheus gontijo", " ")
    assert V.validate?("!@#$%^&*(){}abc123", "!@#$%^&*(){}")
    assert V.validate?("[]?+=/\\-_|\",<>.abc123", "[]?+=/\\-_|\",<>.")
    assert V.validate?("abc[]?+=/\\-_|\",<>. \t\n123", "[]?+=/\\-_|\",<>. \t\n")
    assert V.validate?("a-1*d", "-*")
  end

  test "invalid alphanumeric" do
    refute V.validate?("number 100%")
    refute V.validate?("@#$")
    refute V.validate?("_")
    refute V.validate?("dgç")
    refute V.validate?("\t")
    #    refute V.validate?("\n") @TODO: WHY IS BREAKLINE MATCHING?
    refute V.validate?("\nabc")
    refute V.validate?("\tdef")
    refute V.validate?("\nabc \t")
    refute V.validate?("matheus_gontijo")
  end

  test "invalid alphanumeric with exclusion of characters" do
    refute V.validate?("gontijo_", "$")
    refute V.validate?("google.com", "*")
    refute V.validate?("matheus gontijo", "_")
  end
end
