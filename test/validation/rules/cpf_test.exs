defmodule Validation.Rules.CPFTest do
  use ExUnit.Case
  alias Validation.Rules.CPF, as: V
  doctest Validation

  test "valid cpf" do
    assert {:ok} = V.validate("342.444.198-88")
    assert {:ok} = V.validate("342.444.198.88")
    assert {:ok} = V.validate("350.45261819")
    assert {:ok} = V.validate("693-319-118-40")
    assert {:ok} = V.validate("3.6.8.8.9.2.5.5.4.8.8")
    assert {:ok} = V.validate("11598647644")
    assert {:ok} = V.validate("86734718697")
    assert {:ok} = V.validate("86223423284")
    assert {:ok} = V.validate("24845408333")
    assert {:ok} = V.validate("95574461102")
  end

  test "invalid cpf" do
    assert {:error, _} = V.validate("")
    assert {:error, _} = V.validate("01234567890")
    assert {:error, _} = V.validate("000.000.000-00")
    assert {:error, _} = V.validate("111.222.444-05")
    assert {:error, _} = V.validate("999999999.99")
    assert {:error, _} = V.validate("8.8.8.8.8.8.8.8.8.8.8")
    assert {:error, _} = V.validate("693-319-110-40")
    assert {:error, _} = V.validate("698.111-111.00")
    assert {:error, _} = V.validate("11111111111")
    assert {:error, _} = V.validate("22222222222")
    assert {:error, _} = V.validate("12345678900")
    assert {:error, _} = V.validate("99299929384")
    assert {:error, _} = V.validate("84434895894")
    assert {:error, _} = V.validate("44242340000")
    assert {:error, _} = V.validate("1")
    assert {:error, _} = V.validate("22")
    assert {:error, _} = V.validate("123")
    assert {:error, _} = V.validate("992999999999929384")
  end
end
