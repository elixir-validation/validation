defmodule Validation.Rules.TldTest do
  use ExUnit.Case
  alias Validation.Rules.Tld, as: V
  doctest Validation

  test "valid tld" do
    assert V.validate?("br")
    assert V.validate?("cafe")
    assert V.validate?("com")
    assert V.validate?("democrat")
    assert V.validate?("eu")
    assert V.validate?("gmbh")
    assert V.validate?("us")
  end

  test "invalid tld" do
    refute V.validate?("")
    refute V.validate?("1")
    refute V.validate?("1.0")
    refute V.validate?("wrongtld")
  end
end
