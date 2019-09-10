defmodule Validation.ExcludeCharactersTest do
  use ExUnit.Case
  alias Validation.ExcludeCharacters
  doctest Validation

  test "valid" do
    assert(ExcludeCharacters.exclude("gontijo_", "_"), "gontijo")
    assert(ExcludeCharacters.exclude("google.com", "."), "googlecom")
    assert(ExcludeCharacters.exclude("matheus gontijo", " "), "matheusgontijo")
    assert(ExcludeCharacters.exclude("!@#$%^&*(){}abc", "!@#$%^&*(){}"), "abc")
    assert(ExcludeCharacters.exclude("[]?+=/\\-_|\",<>.abc", "[]?+=/\\-_|\",<>."), "abc")
    assert(ExcludeCharacters.exclude("abc[]?+=/\\-_|\",<>. \t\n", "[]?+=/\\-_|\",<>. \t\n"), "")
    assert(ExcludeCharacters.exclude("a-123*d", "123-*"), "ad")
    assert(ExcludeCharacters.exclude("gontijo_123", "$"), "gontijo_123")
    assert(ExcludeCharacters.exclude("google.com321", "*"), "google.com321")
    assert(ExcludeCharacters.exclude("matheus gontijo1", "_"), "matheus gontijo1")
  end
end
