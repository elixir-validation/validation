defmodule Validation.Rules.CreditCard.Visa do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    CreditCard.validate(input) and visa_validation(input)
  end

  defp visa_validation(input) do
    String.match?(input, ~r/^4\d{12}(?:\d{3})?$/)
  end
end
