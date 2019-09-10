defmodule Validation.Rules.No do

  # @TODO: support other languages

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^n(o(t|pe)?|ix|ay)?$/i)

    if regex_validation do
      {:ok}
    else
      {:error, ~s(Invalid "no" value.")}
    end
  end
end
