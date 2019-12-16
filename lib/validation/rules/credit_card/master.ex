defmodule Validation.Rules.CreditCard.Master do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate?(String.t()) :: boolean
  def validate?(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    CreditCard.validate?(input) and master_validation(input)
  end

  defp master_validation(input) do
    String.match?(input, ~r/(5[1-5]|2[2-7])\d{14}$/)
  end
end
