defmodule Validation.Rules.CreditCard.Jcb do
  @moduledoc false
  alias Validation.Rules.CreditCard

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    CreditCard.validate(input) and jcb_validation(input)
  end

  defp jcb_validation(input) do
    String.match?(input, ~r/^(?:2131|1800|35\d{3})\d{11}$/)
  end
end
