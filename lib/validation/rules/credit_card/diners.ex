defmodule Validation.Rules.CreditCard.Diners do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    if credit_card_validation(input) and diners_validation(input) do
      {:ok}
    else
      {:error, "Invalid credit card value."}
    end
  end

  defp credit_card_validation(input) do
    case CreditCard.validate(input) do
      {:ok} -> true
      {:error, _} -> false
    end
  end

  defp diners_validation(input) do
    String.match?(input, ~r/^3(?:0[0-5]|[68]\d)\d{11}$/)
  end
end
