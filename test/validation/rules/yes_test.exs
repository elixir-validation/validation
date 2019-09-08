defmodule Validation.Rules.YesTest do
  use ExUnit.Case
  alias Validation.Rules.Yes, as: V
  doctest Validation

  test "valid yes" do
    assert {:ok} = V.validate("Y")
    assert {:ok} = V.validate("Yea")
    assert {:ok} = V.validate("Yeah")
    assert {:ok} = V.validate("Yep")
    assert {:ok} = V.validate("Yes")
    assert {:ok} = V.validate("yes")
  end

  test "invalid yes" do
    assert {:error, _} = V.validate("let's thrown an error")
    assert {:error, _} = V.validate("Yydoesnotmatter")
    assert {:error, _} = V.validate("Si")
    assert {:error, _} = V.validate("Sim")
    assert {:error, _} = V.validate("Yoo")
    assert {:error, _} = V.validate("Yiip")
  end
end
