defmodule Validation.Rules.Uppercase do
  @moduledoc false

  @spec validate?(String.t) :: boolean
  def validate?(input) when is_binary(input) do
    input == String.upcase(input)
  end
end
