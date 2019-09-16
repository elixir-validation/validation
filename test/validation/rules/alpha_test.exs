defmodule Validation.Rules.AlphaTest do
  use ExUnit.Case
  alias Validation.Rules.Alpha, as: V
  doctest Validation

  test "valid alpha" do
    assert V.validate?("")
    assert V.validate?("matheus")
    assert V.validate?("gontijo")
    assert V.validate?("a")
    assert V.validate?("foobar")
  end

  test "valid with exclusion of characters" do
    assert V.validate?("gontijo_", "_")
    assert V.validate?("google.com", ".")
    assert V.validate?("matheus gontijo", " ")
    assert V.validate?("!@#$%^&*(){}abc", "!@#$%^&*(){}")
    assert V.validate?("[]?+=/\\-_|\",<>.abc", "[]?+=/\\-_|\",<>.")
    assert V.validate?("abc[]?+=/\\-_|\",<>. \t\n", "[]?+=/\\-_|\",<>. \t\n")
    assert V.validate?("a-123*d", "123-*")
  end

  test "invalid alpha" do
    refute V.validate?("123")
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

  test "invalid with exclusion of characters" do
    refute V.validate?("gontijo_123", "$")
    refute V.validate?("google.com321", "*")
    refute V.validate?("matheus gontijo1", "_")
  end
end
