defmodule Validation.Rules.NoTest do
  use ExUnit.Case
  alias Validation.Rules.No, as: V
  doctest Validation

  test "valid no" do
    assert V.validate("N")
    assert V.validate("n")
    assert V.validate("Nay")
    assert V.validate("Nix")
    assert V.validate("No")
    assert V.validate("Nope")
    assert V.validate("Not")
  end

  test "invalid no" do
    refute V.validate("Donnot")
    refute V.validate("Never")
    refute V.validate("Niet")
    refute V.validate("Noooooooo")
    refute V.validate("Não")
    refute V.validate("não")
  end
end
