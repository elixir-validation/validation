defmodule Validation.Rules.Even do
  @moduledoc false

  @spec validate(Integer.t) :: Validation.default
  def validate(input) when is_integer(input) do
    import Integer, only: [is_even: 1]

    Integer.is_even(input)
  end
end
