defmodule Validation.Rules.CPFTest do
  use ExUnit.Case
  alias Validation.Rules.CPF, as: V
  doctest Validation

  test "valid cpf" do
    assert V.validate?("342.444.198-88")
    assert V.validate?("342.444.198.88")
    assert V.validate?("350.45261819")
    assert V.validate?("693-319-118-40")
    assert V.validate?("3.6.8.8.9.2.5.5.4.8.8")
    assert V.validate?("11598647644")
    assert V.validate?("86734718697")
    assert V.validate?("86223423284")
    assert V.validate?("24845408333")
    assert V.validate?("95574461102")
  end

  test "invalid cpf" do
    refute V.validate?("")
    refute V.validate?("01234567890")
    refute V.validate?("000.000.000-00")
    refute V.validate?("111.222.444-05")
    refute V.validate?("999999999.99")
    refute V.validate?("8.8.8.8.8.8.8.8.8.8.8")
    refute V.validate?("693-319-110-40")
    refute V.validate?("698.111-111.00")
    refute V.validate?("11111111111")
    refute V.validate?("22222222222")
    refute V.validate?("12345678900")
    refute V.validate?("99299929384")
    refute V.validate?("84434895894")
    refute V.validate?("44242340000")
    refute V.validate?("1")
    refute V.validate?("22")
    refute V.validate?("123")
    refute V.validate?("992999999999929384")
  end
end
