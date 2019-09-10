defmodule Validation.Rules.EmailTest do
  use ExUnit.Case
  alias Validation.Rules.Email, as: V
  doctest Validation

  test "valid email" do
    assert V.validate("test@test.com")
    assert V.validate("mail+mail@gmail.com")
    assert V.validate("mail.email@e.test.com")
    assert V.validate("a@a.a")
    assert V.validate("email@domain.com")
    assert V.validate("firstname.lastname@domain.com")
    assert V.validate("email@subdomain.domain.com")
    assert V.validate("firstname+lastname@domain.com")
    assert V.validate("email@123.123.123.123")
    assert V.validate("email@[123.123.123.123]")
    assert V.validate("\"email\"@domain.com")
    assert V.validate("1234567890@domain.com")
    assert V.validate("email@domain-one.com")
    assert V.validate("_______@domain.com")
    assert V.validate("email@domain.name")
    assert V.validate("email@domain.co.jp")
    assert V.validate("firstname-lastname@domain.com")
  end

  test "invalid email" do
    refute V.validate("")
    refute V.validate("test")
    refute V.validate("@test.com")
    refute V.validate("mail@test@test.com")
    refute V.validate("test.test@")
    refute V.validate("test.@test.com")
    refute V.validate("test@.test.com")
    refute V.validate("test@test..com")
    refute V.validate("test@test.com.")
    refute V.validate(".test@test.com")
    refute V.validate("plainaddress")
    refute V.validate("#@%^%#$@#$@#.com")
    refute V.validate("@domain.com")
    refute V.validate("email.domain.com")
    refute V.validate("email@domain@domain.com")
    refute V.validate(".email@domain.com")
    refute V.validate("email.@domain.com")
    refute V.validate("email..email@domain.com")
    refute V.validate("email@domain.com (Joe Smith)")
  end
end
