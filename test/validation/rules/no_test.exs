defmodule Validation.Rules.NoTest do
  use ExUnit.Case
  alias Validation.Rules.No, as: V
  doctest Validation

  test "valid no" do
    assert {:ok} = V.validate("N")
    assert {:ok} = V.validate("n")
    assert {:ok} = V.validate("Nay")
    assert {:ok} = V.validate("Nix")
    assert {:ok} = V.validate("No")
    assert {:ok} = V.validate("Nope")
    assert {:ok} = V.validate("Not")
  end

  test "invalid no" do
    assert {:error, _} = V.validate("Donnot")
    assert {:error, _} = V.validate("Never")
    assert {:error, _} = V.validate("Niet")
    assert {:error, _} = V.validate("Noooooooo")
    assert {:error, _} = V.validate("Não")
    assert {:error, _} = V.validate("não")
  end
end
