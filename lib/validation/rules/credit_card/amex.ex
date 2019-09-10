defmodule Validation.Rules.CreditCard.Amex do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate(String.t) :: boolean
  def validate(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    CreditCard.validate(input) and amex_validation(input)
  end

  defp amex_validation(input) do
    String.match?(input, ~r/^3[47]\d{13}$/)
  end
end
