defmodule Validation.Rules.Digit do
  @moduledoc false

  @spec validate?(String.t) :: boolean
  def validate?(input) when is_binary(input) do
    String.match?(input, ~r/^[0-9]+$/)
  end

  @spec validate?(String.t, String.t) :: boolean
  def validate?(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    validate?(Validation.ExcludeCharacters.exclude(input, excluded_characters))
  end
end
