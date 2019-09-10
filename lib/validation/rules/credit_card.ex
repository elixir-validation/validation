defmodule Validation.Rules.CreditCard do
  @moduledoc false
  alias Validation.Rules.Luhn

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    case Luhn.validate(input) do
      {:ok} -> {:ok}
      {:error, _} -> {:error, "Invalid credit card value."}
    end
  end
end
