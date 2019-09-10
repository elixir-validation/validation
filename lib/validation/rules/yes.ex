defmodule Validation.Rules.Yes do
  @moduledoc false

  # @TODO: support other languages

  @spec validate(String.t) :: boolean
  def validate(input) when is_binary(input) do
    String.match?(input, ~r/^y(eah?|ep|es)?$/i)
  end
end
