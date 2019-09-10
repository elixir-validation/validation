defmodule Validation.Rules.CreditCard.Visa do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    if credit_card_validation(input) and visa_validation(input) do
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

  defp visa_validation(input) do
    String.match?(input, ~r/^4\d{12}(?:\d{3})?$/)
  end
end
