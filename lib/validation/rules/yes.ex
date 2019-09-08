defmodule Validation.Rules.Yes do

  # @TODO: support other languages

  @doc """
  Validates if value is considered as "Yes".
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^y(eah?|ep|es)?$/i)

    if regex_validation do
      {:ok}
    else
      {:error, ~s(Invalid "yes" value.")}
    end
  end
end
