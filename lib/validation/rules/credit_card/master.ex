defmodule Validation.Rules.CreditCard.Master do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    if credit_card_validation(input) and master_validation(input) do
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

  defp master_validation(input) do
    String.match?(input, ~r/(5[1-5]|2[2-7])\d{14}$/)
  end
end
