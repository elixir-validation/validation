defmodule Validation.Rules.CreditCard.Discover do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate?(String.t()) :: boolean
  def validate?(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    CreditCard.validate?(input) and discover_validation(input)
  end

  defp discover_validation(input) do
    String.match?(input, ~r/^6(?:011|5\d{2})\d{12}$/)
  end
end
