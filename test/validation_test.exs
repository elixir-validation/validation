defmodule ValidationTest do
  use ExUnit.Case
  doctest Validation

  test "greets the world" do
    assert Validation.hello() == :world
  end
end
