defmodule Validation.Rules.YesTest do
  use ExUnit.Case
  alias Validation.Rules.Yes, as: V
  doctest Validation

  test "valid yes" do
    assert V.validate("Y")
    assert V.validate("Yea")
    assert V.validate("Yeah")
    assert V.validate("Yep")
    assert V.validate("Yes")
    assert V.validate("yes")
  end

  test "invalid yes" do
    refute V.validate("let's thrown an error")
    refute V.validate("Yydoesnotmatter")
    refute V.validate("Si")
    refute V.validate("Sim")
    refute V.validate("Yoo")
    refute V.validate("Yiip")
  end
end
