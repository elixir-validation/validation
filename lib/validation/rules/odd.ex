defmodule Validation.Rules.Odd do
  @moduledoc false

  @spec validate?(Integer.t()) :: boolean
  def validate?(input) when is_integer(input) do
    import Integer, only: [is_odd: 1]
    is_odd(input)
  end
end
