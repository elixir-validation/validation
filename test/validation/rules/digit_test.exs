defmodule Validation.Rules.DigitTest do
  use ExUnit.Case
  alias Validation.Rules.Digit, as: V
  doctest Validation

  test "valid digit" do
    assert V.validate?("165")
    assert V.validate?("01650")
    assert V.validate?("01")
  end

  test "valid digit with exclusion of characters" do
    assert V.validate?("1.0", ".")
    assert V.validate?("16-50", "-")
    assert V.validate?("16-5.0", "-.")
    assert V.validate?("!@#$%^8&*(){}", "!@#$%^&*(){}")
    assert V.validate?("012.071.070-69", "-.")
  end

  test "invalid digit" do
    refute V.validate?("")
    refute V.validate?("-1.1")
    refute V.validate?("-12")
    refute V.validate?("1.0")
    refute V.validate?("16 50")
    refute V.validate?("16-50")
    refute V.validate?("1\n1")
    refute V.validate?("1\t1")
    refute V.validate?("a")
    refute V.validate?("a1")
  end

  test "invalid digit with exclusion of characters" do
    refute V.validate?("1.%0", ".")
    refute V.validate?("16-a50", "-")
    refute V.validate?("3333316-5.0/", "-.")
  end
end
