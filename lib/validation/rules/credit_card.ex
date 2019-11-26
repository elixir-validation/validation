defmodule Validation.Rules.CreditCard do
  @moduledoc false
  alias Validation.Rules.Luhn

  @spec validate?(String.t()) :: boolean
  def validate?(input) when is_binary(input) do
    Luhn.validate?(input)
  end
end
