defmodule Validation.Rules.CNPJTest do
  use ExUnit.Case
  alias Validation.Rules.CNPJ, as: V
  doctest Validation

  test "valid cnpj" do
    assert {:ok} = V.validate("32.063.364/0001-07")
    assert {:ok} = V.validate("24.663.454/0001-00")
    assert {:ok} = V.validate("57.535.083/0001-30")
    assert {:ok} = V.validate("24.760.428/0001-09")
    assert {:ok} = V.validate("27.355.204/0001-00")
    assert {:ok} = V.validate("36.310.327/0001-07")
    assert {:ok} = V.validate("38175021000110")
    assert {:ok} = V.validate("37550610000179")
    assert {:ok} = V.validate("12774546000189")
    assert {:ok} = V.validate("77456211000168")
    assert {:ok} = V.validate("02023077000102")
  end

  test "invalid cnpj" do
    assert {:error, _} = V.validate("12.345.678/9012-34")
    assert {:error, _} = V.validate("11.111.111/1111-11")
    assert {:error, _} = V.validate("00000000000000")
    assert {:error, _} = V.validate("11111111111111")
    assert {:error, _} = V.validate("22222222222222")
    assert {:error, _} = V.validate("33333333333333")
    assert {:error, _} = V.validate("44444444444444")
    assert {:error, _} = V.validate("55555555555555")
    assert {:error, _} = V.validate("66666666666666")
    assert {:error, _} = V.validate("77777777777777")
    assert {:error, _} = V.validate("88888888888888")
    assert {:error, _} = V.validate("99999999999999")
    assert {:error, _} = V.validate("12345678900123")
    assert {:error, _} = V.validate("99299929384987")
    assert {:error, _} = V.validate("84434895894444")
    assert {:error, _} = V.validate("44242340000000")
    assert {:error, _} = V.validate("1")
    assert {:error, _} = V.validate("22")
    assert {:error, _} = V.validate("123")
    assert {:error, _} = V.validate("992999999999929384")
    assert {:error, _} = V.validate("99-010-0.")
  end
end
