defmodule Validation.Rules.CNPJTest do
  use ExUnit.Case
  alias Validation.Rules.CNPJ, as: V
  doctest Validation

  test "valid cnpj" do
    assert V.validate("32.063.364/0001-07")
    assert V.validate("24.663.454/0001-00")
    assert V.validate("57.535.083/0001-30")
    assert V.validate("24.760.428/0001-09")
    assert V.validate("27.355.204/0001-00")
    assert V.validate("36.310.327/0001-07")
    assert V.validate("38175021000110")
    assert V.validate("37550610000179")
    assert V.validate("12774546000189")
    assert V.validate("77456211000168")
    assert V.validate("02023077000102")
  end

  test "invalid cnpj" do
    refute V.validate("12.345.678/9012-34")
    refute V.validate("11.111.111/1111-11")
    refute V.validate("00000000000000")
    refute V.validate("11111111111111")
    refute V.validate("22222222222222")
    refute V.validate("33333333333333")
    refute V.validate("44444444444444")
    refute V.validate("55555555555555")
    refute V.validate("66666666666666")
    refute V.validate("77777777777777")
    refute V.validate("88888888888888")
    refute V.validate("99999999999999")
    refute V.validate("12345678900123")
    refute V.validate("99299929384987")
    refute V.validate("84434895894444")
    refute V.validate("44242340000000")
    refute V.validate("1")
    refute V.validate("22")
    refute V.validate("123")
    refute V.validate("992999999999929384")
    refute V.validate("99-010-0.")
  end
end
