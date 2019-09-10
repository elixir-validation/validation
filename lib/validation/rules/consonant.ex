defmodule Validation.Rules.Consonant do
  @moduledoc false

  @spec validate(String.t) :: boolean
  def validate(input) when is_binary(input) do
    String.match?(input, ~r/^(\s|[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z])*$/)
  end

  @spec validate(String.t, String.t) :: boolean
  def validate(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    validate(Validation.ExcludeCharacters.exclude(input, excluded_characters))
  end
end
