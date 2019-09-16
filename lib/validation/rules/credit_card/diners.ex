defmodule Validation.Rules.CreditCard.Diners do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate?(String.t) :: boolean
  def validate?(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    CreditCard.validate?(input) and diners_validation(input)
  end

  defp diners_validation(input) do
    String.match?(input, ~r/^3(?:0[0-5]|[68]\d)\d{11}$/)
  end
end
