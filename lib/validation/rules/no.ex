defmodule Validation.Rules.No do
  @moduledoc false

  # @TODO: support other languages

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    String.match?(input, ~r/^n(o(t|pe)?|ix|ay)?$/i)
  end
end
